import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nav_mode_api.g.dart';

/// Platform interface
abstract class AndroidNavModePlatform extends PlatformInterface {
  /// Constructs platform interface
  AndroidNavModePlatform() : super(token: _token);
  static final _token = Object();
  static AndroidNavModePlatform _instance = _PlaceholderImplementation();

  /// The instance of the AndroidNavModePlatform
  static AndroidNavModePlatform get instance => _instance;

  /// Platform-specific plugins should override this with their own
  /// platform-specific class that extends [VideoPlayerPlatform] when they
  /// register themselves.
  static set instance(final AndroidNavModePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  final _api = NavBarApi();
}

class _PlaceholderImplementation extends AndroidNavModePlatform {}

/// Android implementation
class AndroidNavMode extends AndroidNavModePlatform {
  AndroidNavMode._() : super();

  /// Registers this class as the default instance of [AndroidNavMode].
  static void registerWith() =>
      AndroidNavModePlatform.instance = AndroidNavMode._();

  /// {@template get_navigation_mode}
  /// Gets the current Android navigation bar mode.
  ///
  /// Returns a [NavBarMode] enum value indicating the current navigation style:
  /// - [NavBarMode.threeButtons]: Traditional three-button navigation
  /// - [NavBarMode.twoButtons]: Two-button navigation
  /// - [NavBarMode.gesture]: Full gesture navigation
  /// - [NavBarMode.unknown]: Navigation mode could not be determined
  ///
  /// This method is only supported on Android. On other platforms, it will
  /// return [NavBarMode.unknown].
  /// {@endtemplate}
  Future<NavBarMode> getNavigationMode() async {
    try {
      return await _api.getNavBarMode();
    } on PlatformException catch (e, stackTrace) {
      log('Error getting navigation mode: $e', stackTrace: stackTrace);
      return NavBarMode.unknown;
    }
  }
}
