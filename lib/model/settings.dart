/// The duration of the opacity animation.
const kOpacityAnimationDuration = Duration(milliseconds: 500);

/// The default duration of the circle animation.
const kDefaultCircleAnimationDuration = Duration(milliseconds: 500);

/// The duration of the ball bounce animation.
const kBallBounceDuration = Duration(milliseconds: 2000);

/// An enum representing the different types of settings available.
enum SettingsType {
  circleAnimationDuration,
  opacityDuration,
  ballBounceDuration,
}

extension SettingsTypeExtension on SettingsType {
  /// Returns a string representation of the enum value.
  String toDisplayString() {
    switch (this) {
      case SettingsType.circleAnimationDuration:
        return 'Circle grow duration';
      case SettingsType.opacityDuration:
        return 'Opacity duration';
      case SettingsType.ballBounceDuration:
        return 'Ball bounce duration';
    }
  }
}

/// A class representing a user setting.
class UserSetting {
  /// The type of the setting.
  final SettingsType type;

  /// The value of the setting.
  Duration value;

  UserSetting(this.type, this.value);
}

/// A class representing the user settings.
class UserSettings {
  /// A list of user settings.
  static List<UserSetting> list = [
    UserSetting(
      SettingsType.circleAnimationDuration,
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

  /// Returns the duration of the circle grow animation.
  static Duration get circleGrowDuration => list
      .firstWhere(
          (element) => element.type == SettingsType.circleAnimationDuration)
      .value;

  /// Returns the duration of the opacity animation.
  static Duration get opacityDuration => list
      .firstWhere((element) => element.type == SettingsType.opacityDuration)
      .value;

  /// Returns the duration of the ball bounce animation.
  static Duration get ballBounceDuration => list
      .firstWhere((element) => element.type == SettingsType.ballBounceDuration)
      .value;
}
