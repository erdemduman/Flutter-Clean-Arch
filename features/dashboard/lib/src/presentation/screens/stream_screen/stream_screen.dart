import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../dashboard.dart';
import 'bloc/stream_event.dart';
import 'bloc/stream_state.dart';

class StreamScreen extends StatefulWidget {
  final BlocNoParameter parameter;

  const StreamScreen({super.key, required this.parameter});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      bloc: Injector.container<StreamBloc>(),
      parameter: widget.parameter,
      child: const StreamScreenBody(),
    );
  }
}

class StreamScreenBody extends StatefulWidget {
  const StreamScreenBody({super.key});

  @override
  State<StreamScreenBody> createState() => _StreamScreenBodyState();
}

class _StreamScreenBodyState extends State<StreamScreenBody> {
  StreamBloc? _bloc;
  int _maxLimit = 25;
  DisabledButton _disabledButton = DisabledButton.max25;

  @override
  void initState() {
    super.initState();
    _bloc = BaseScreen.of<StreamBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream"),
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
                  previousPage: "Stream Screen",
                ),
              );
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<StreamBloc, StreamState>(builder: (context, state) {
          return Column(
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
                              if (state.isRunning) {
                                _bloc?.add(
                                  FetchNumberStreamEvent(
                                    maxLimit: _maxLimit,
                                    isRunning: true,
                                  ),
                                );
                              }
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
                              if (state.isRunning) {
                                _bloc?.add(
                                  FetchNumberStreamEvent(
                                    maxLimit: _maxLimit,
                                    isRunning: true,
                                  ),
                                );
                              }
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
                              if (state.isRunning) {
                                _bloc?.add(
                                  FetchNumberStreamEvent(
                                    maxLimit: _maxLimit,
                                    isRunning: true,
                                  ),
                                );
                              }
                            }
                          : null,
                      child: const Text('100')),
                ],
              ),
              Text(state.number),
              TextButton(
                onPressed: () {
                  _bloc?.add(FetchNumberStreamEvent(
                    maxLimit: _maxLimit,
                    isRunning: !state.isRunning,
                  ));
                },
                child: Text(
                  !state.isRunning
                      ? context.strId.fetch_number_stream
                      : context.strId.stop_stream,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
