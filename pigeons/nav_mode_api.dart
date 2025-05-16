// Copyright 2024. See LICENSE for details.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/nav_mode_api.g.dart',
    kotlinOut:
        'android/src/main/kotlin/com/example/flutter_nav_mode/NavModeApi.kt',
    kotlinOptions: KotlinOptions(package: 'com.example.flutter_nav_mode'),
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)
/// {@template nav_bar_mode}
/// Represents the navigation bar mode on Android devices.
///
/// Possible values:
/// - [threeButton]: Traditional three-button navigation
/// - [twoButton]: Two-button navigation (back + home)
/// - [gesture]: Full gesture navigation
/// - [unknown]: Navigation mode could not be determined
/// {@endtemplate}
enum NavBarMode {
  /// Traditional three-button navigation (back, home, recents)
  threeButton,

  /// Two-button navigation with back and home buttons
  twoButton,

  /// Full gesture navigation without buttons
  gesture,

  /// Navigation mode could not be determined
  unknown,
}

/// {@template nav_bar_api}
/// Platform API for accessing Android navigation bar mode.
///
/// Usage:
/// ```dart
/// final mode = await NavBarApi().getNavBarMode();
/// print('Current navigation mode: $mode');
/// ```
/// {@endtemplate}
@HostApi()
abstract class NavBarApi {
  /// {@template get_nav_bar_mode}
  /// Retrieves the current navigation bar mode from the Android system.
  ///
  /// Returns [NavBarMode] indicating the current navigation style.
  /// May return [NavBarMode.unknown] if the mode cannot be determined.
  /// {@endtemplate}
  NavBarMode getNavBarMode();
}
