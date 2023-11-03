import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../dashboard.dart';
import 'bloc/number_event.dart';
import 'bloc/number_state.dart';

class NumberScreen extends StatefulWidget {
  final BlocNoParameter parameter;

  const NumberScreen({super.key, required this.parameter});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      bloc: Injector.resolve<NumberBloc>(),
      parameter: widget.parameter,
      child: const NumberScreenBody(),
    );
  }
}

class NumberScreenBody extends StatefulWidget {
  const NumberScreenBody({super.key});

  @override
  State<NumberScreenBody> createState() => _NumberScreenBodyState();
}

class _NumberScreenBodyState extends State<NumberScreenBody> {
  NumberBloc? _bloc;
  int _maxLimit = 25;
  DisabledButton _disabledButton = DisabledButton.max25;

  @override
  void initState() {
    super.initState();
    _bloc = BaseScreen.of<NumberBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(
                context,
                Routes.settings,
                arguments: const SettingsBlocParameter(
                  previousPage: "Number Screen",
                ),
              );
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: BlocBuilder<NumberBloc, NumberState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${context.strId.max_limit}: $_maxLimit"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: _disabledButton != DisabledButton.max25
                            ? () {
                                setState(() {
                                  _maxLimit = 25;
                                  _disabledButton = DisabledButton.max25;
                                });
                              }
                            : null,
                        child: const Text('25')),
                    TextButton(
                        onPressed: _disabledButton != DisabledButton.max50
                            ? () {
                                setState(() {
                                  _maxLimit = 50;
                                  _disabledButton = DisabledButton.max50;
                                });
                              }
                            : null,
                        child: const Text('50')),
                    TextButton(
                        onPressed: _disabledButton != DisabledButton.max100
                            ? () {
                                setState(() {
                                  _maxLimit = 100;
                                  _disabledButton = DisabledButton.max100;
                                });
                              }
                            : null,
                        child: const Text('100')),
                  ],
                ),
                Text(state.number),
                TextButton(
                  onPressed: () {
                    _bloc?.add(FetchNumberEvent(maxLimit: _maxLimit));
                  },
                  child: Text(context.strId.fetch_number),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
