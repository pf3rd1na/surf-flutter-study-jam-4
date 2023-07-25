import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/model/settings.dart';
import 'package:surf_practice_magic_ball/provider/settings_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() {
    return SettingsScreenState();
  }
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  final List<Widget> _settings = [];
  final formKey = GlobalKey<FormState>();
  late List<UserSetting> _userSettings;

  void _loadSettings() {
    _settings.clear();
    _userSettings = ref.watch(settingsProvider);
    for (var element in _userSettings) {
      _settings.add(
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: element.type.toDisplayString(),
            ),
            initialValue: element.value.inMilliseconds.toString(),
            validator: _validateInput,
            onSaved: (value) {
              ref.read(settingsProvider.notifier).updateSetting(
                    element.type,
                    Duration(milliseconds: int.parse(value!)),
                  );
            },
          ),
        ),
      );
    }
  }

  void _resetSettings() {
    for (var element in _userSettings) {
      switch (element.type) {
        case SettingsType.circleAnimationDuration:
          ref.read(settingsProvider.notifier).updateSetting(
                element.type,
                kDefaultCircleAnimationDuration,
              );
        case SettingsType.opacityDuration:
          ref.read(settingsProvider.notifier).updateSetting(
                element.type,
                kOpacityAnimationDuration,
              );
        case SettingsType.ballBounceDuration:
          ref.read(settingsProvider.notifier).updateSetting(
                element.type,
                kBallBounceDuration,
              );
      }
    }
    Navigator.pop(context);
  }

  void _saveSettings() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pop(context);
    }
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    final result = int.tryParse(value);
    if (result == null) {
      return 'Please enter a valid value';
    }
    if (result < 0 || result > 2000) {
      return 'Please enter a value between 0 and 2000';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadSettings();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            ..._settings,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: _resetSettings,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveSettings,
                    child: const Text('Save'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
