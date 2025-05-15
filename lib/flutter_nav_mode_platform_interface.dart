import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_nav_mode_method_channel.dart';

abstract class FlutterNavModePlatform extends PlatformInterface {
  /// Constructs a FlutterNavModePlatform.
  FlutterNavModePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNavModePlatform _instance = MethodChannelFlutterNavMode();

  /// The default instance of [FlutterNavModePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNavMode].
  static FlutterNavModePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNavModePlatform] when
  /// they register themselves.
  static set instance(FlutterNavModePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
