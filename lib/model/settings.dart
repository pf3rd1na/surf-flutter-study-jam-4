const kOpacityAnimationDuration = Duration(milliseconds: 500);
const kDefaultCircleAnimationDuration = Duration(milliseconds: 500);
const kBallBounceDuration = Duration(milliseconds: 2000);

enum SettingsType {
  circleGrowDuration,
  opacityDuration,
  ballBounceDuration,
}

class UserSetting {
  final SettingsType type;
  final Duration value;

  UserSetting(this.type, this.value);
}

class UserSettings {
  static List<UserSetting> list = [
    UserSetting(
      SettingsType.circleGrowDuration,
      kDefaultCircleAnimationDuration,
    ),
    UserSetting(
      SettingsType.opacityDuration,
      kOpacityAnimationDuration,
    ),
    UserSetting(
      SettingsType.ballBounceDuration,
      kBallBounceDuration,
    ),
  ];

  static Duration get circleGrowDuration => list
      .firstWhere((element) => element.type == SettingsType.circleGrowDuration)
      .value;

  static Duration get opacityDuration => list
      .firstWhere((element) => element.type == SettingsType.opacityDuration)
      .value;

  static Duration get ballBounceDuration => list
      .firstWhere((element) => element.type == SettingsType.ballBounceDuration)
      .value;
}
