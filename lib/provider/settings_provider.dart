import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/model/settings.dart';

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, List<UserSetting>>((ref) {
  return SettingsNotifier(UserSettings.list);
});

class SettingsNotifier extends StateNotifier<List<UserSetting>> {
  SettingsNotifier(List<UserSetting> state) : super(state);

  updateSetting(SettingsType type, Duration value) {
    state = [
      for (var element in state)
        if (element.type == type) UserSetting(type, value) else element
    ];
  }
}
