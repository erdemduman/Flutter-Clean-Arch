import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final BlocNoParameter parameter;

  const MainScreen({super.key, required this.parameter});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      bloc: Injector.resolve<MainBloc>(),
      parameter: widget.parameter,
      child: const MainScreenBody(),
    );
  }
}

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({super.key});

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test App"),
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
              onPressed: () {
                Navigator.pushNamed(context, Routes.number);
              },
              child: Text(context.strId.random_number),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.stream);
              },
              child: Text(context.strId.random_number_stream),
            ),
          ],
        ),
      ),
    );
  }
}
