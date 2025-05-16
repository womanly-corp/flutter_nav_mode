// Copyright 2024. See LICENSE for details.

import 'dart:io';

import 'android_nav_mode.dart';
import 'nav_mode_api.g.dart';

export 'nav_mode_api.g.dart' show NavBarMode;

/// {@template FlutterNavModeBase.base}
/// Since there is different API's for iOS and Android, this class purpose
/// only for Android.
/// {@endtemplate}
class FlutterNavModeBase {
  AndroidNavMode get _androidPlatform =>
      AndroidNavModePlatform.instance as AndroidNavMode;
}

/// {@template flutter_nav_mode}
/// A Flutter plugin to detect Android navigation bar mode.
///
/// Supports detection of:
/// - Three-button navigation (back, home, recents)
/// - Two-button navigation (back + home)
/// - Gesture navigation
///
/// Example usage:
/// ```dart
/// final mode = await FlutterNavMode.getNavigationMode();
/// print('Current navigation mode: $mode');
/// ```
/// {@endtemplate}
class FlutterNavMode extends FlutterNavModeBase {
  FlutterNavMode._();

  /// {@template FlutterNavModeBase.instance}
  /// There should be only one instance of FlutterNavMode
  /// {@endtemplate}
  static final instance = FlutterNavMode._();

  /// {@template FlutterNavMode.getNavigationMode}
  /// Get the current navigation mode
  /// {@endtemplate}
  Future<NavBarMode> getNavigationMode() async {
    if (Platform.isAndroid) {
      return _androidPlatform.getNavigationMode();
    }
    return NavBarMode.unknown;
  }
}
