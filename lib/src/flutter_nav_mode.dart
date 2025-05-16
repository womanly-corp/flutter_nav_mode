// Copyright 2024. See LICENSE for details.

import 'nav_mode_api.g.dart';

export 'nav_mode_api.g.dart' show NavBarMode;

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
class FlutterNavMode {
  static final _api = NavBarApi();

  /// {@template get_navigation_mode}
  /// Gets the current Android navigation bar mode.
  ///
  /// Returns a [NavBarMode] enum value indicating the current navigation style:
  /// - [NavBarMode.threeButton]: Traditional three-button navigation
  /// - [NavBarMode.twoButton]: Two-button navigation
  /// - [NavBarMode.gesture]: Full gesture navigation
  /// - [NavBarMode.unknown]: Navigation mode could not be determined
  ///
  /// This method is only supported on Android. On other platforms, it will
  /// return [NavBarMode.unknown].
  /// {@endtemplate}
  static Future<NavBarMode> getNavigationMode() async {
    try {
      return await _api.getNavBarMode();
    } catch (e) {
      return NavBarMode.unknown;
    }
  }
}
