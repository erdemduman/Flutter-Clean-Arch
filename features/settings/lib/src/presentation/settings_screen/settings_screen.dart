import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/presentation/settings_screen/bloc/settings_state.dart';

import 'bloc/settings_bloc.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsBlocParameter parameter;

  const SettingsScreen({super.key, required this.parameter});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        blocMap: {Injector.resolve<SettingsBloc>(): widget.parameter},
        child: const SettingsScreenBody());
  }
}

class SettingsScreenBody extends StatefulWidget {
  const SettingsScreenBody({super.key});

  @override
  State<SettingsScreenBody> createState() => _SettingsScreenBodyState();
}

class _SettingsScreenBodyState extends State<SettingsScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        return Center(child: Text("Previous page: ${state.previousPage}"));
      }),
    );
  }
}
