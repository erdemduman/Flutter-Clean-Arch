import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../dashboard.dart';

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
        blocMap: {Injector.container<StreamBloc>(): widget.parameter},
        child: const StreamScreenBody());
  }
}

class StreamScreenBody extends StatefulWidget {
  const StreamScreenBody({super.key});

  @override
  State<StreamScreenBody> createState() => _StreamScreenBodyState();
}

class _StreamScreenBodyState extends State<StreamScreenBody> {
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
                arguments:
                    const SettingsBlocParameter(previousPage: "Main Screen"),
              );
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("Random Stream"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Random Stream stream"),
            ),
          ],
        ),
      ),
    );
  }
}
