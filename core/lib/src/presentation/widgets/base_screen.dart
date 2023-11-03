import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/base_bloc.dart';
import '../bloc/base_event.dart';
import '../bloc/base_state.dart';
import '../bloc/bloc_parameter.dart';

class BaseScreen<T extends BaseBloc<BaseEvent, BaseState>>
    extends StatefulWidget {
  final T bloc;
  final BlocParameter parameter;
  final Widget child;

  const BaseScreen({
    Key? key,
    required this.bloc,
    required this.parameter,
    required this.child,
  }) : super(key: key);

  static T? of<T extends BaseBloc>(BuildContext context) {
    final BaseScreen<T>? provider = context.findAncestorWidgetOfExactType();
    return provider?.bloc;
  }

  @override
  State createState() => _BaseScreenPocState<T>();
}

class _BaseScreenPocState<K extends BaseBloc<BaseEvent, BaseState>>
    extends State<BaseScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    widget.bloc.init(parameter: widget.parameter);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<K>.value(
      value: widget.bloc as K,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    widget.bloc.close();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
