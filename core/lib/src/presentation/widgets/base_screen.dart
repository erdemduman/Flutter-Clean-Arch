import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

/// This class is used in order to be able to create Blocs and attach them to
/// a screen. Everytime a screen is created with this class, its Blocs's init
/// and dispose functions are called based on the current state of the app.
///
/// NOTE: Please create every widget with this class.
///
/// USAGE:
///
/// ----------------------------------------------------------------------------
///
/// class FirstScreen extends StatefulWidget {
///   final BlocNoParameter parameter;

///   const FirstScreen({Key? key, required this.parameter}) : super(key: key);

///   @override
///   State<FirstScreen> createState() => _FirstScreenState();
/// }

/// class _FirstScreenState extends State<FirstScreen> {
///   @override
///   Widget build(BuildContext context) {
///     return BaseScreen(
///       bloc: Injector.resolve!<FirstScreenCubit>(),
///       parameter: widget.parameter,
///       child: const FirstScreenBody(),
///     );
///   }
/// }
///
/// ----------------------------------------------------------------------------

class BaseScreen extends StatefulWidget {
  final Map<BaseBloc, BlocParameter> blocMap;
  final Widget child;

  const BaseScreen({
    Key? key,
    required this.blocMap,
    required this.child,
  }) : super(key: key);

  /// Use this method to get the cubit of the current screen.
  ///
  /// USAGE:
  ///
  /// --------------------------------------------------------------------------
  /// MainBloc bloc = BaseScreen.of<MainBloc>(context);
  /// --------------------------------------------------------------------------
  static T? of<T extends BaseBloc>(BuildContext context) {
    final BaseScreen? provider = context.findAncestorWidgetOfExactType();
    if (provider != null) {
      return provider.blocMap.keys
          .firstWhereOrNull((bloc) => bloc.runtimeType == T) as T;
    }
    return null;
  }

  @override
  State createState() => _CubitProviderState();
}

class _CubitProviderState extends State<BaseScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    widget.blocMap.forEach((bloc, parameter) {
      bloc.init(parameter: parameter);
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: widget.blocMap.keys
          .map((bloc) => BlocProvider.value(value: bloc))
          .toList(),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    widget.blocMap.forEach((bloc, _) {
      bloc.dispose();
      bloc.close();
    });
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
