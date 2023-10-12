import 'package:core/core.dart';
import 'package:dashboard/src/presentation/number_screen/bloc/number_event.dart';
import 'package:dashboard/src/presentation/number_screen/bloc/number_state.dart';
import 'package:flutter/material.dart';

import '../../../dashboard.dart';

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
        blocMap: {Injector.resolve<NumberBloc>(): widget.parameter},
        child: const NumberScreenBody());
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
                arguments:
                    const SettingsBlocParameter(previousPage: "Number Screen"),
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
                Text("Max Limit: $_maxLimit"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _maxLimit = 25;
                          });
                        },
                        child: const Text('25')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _maxLimit = 50;
                          });
                        },
                        child: const Text('50')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _maxLimit = 100;
                          });
                        },
                        child: const Text('100')),
                  ],
                ),
                Text(state.number),
                TextButton(
                  onPressed: () {
                    _bloc?.add(FetchNumberEvent(maxLimit: _maxLimit));
                  },
                  child: const Text("Click to fetch a random number!"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
