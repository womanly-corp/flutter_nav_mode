import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_nav_mode_platform_interface.dart';

/// An implementation of [FlutterNavModePlatform] that uses method channels.
class MethodChannelFlutterNavMode extends FlutterNavModePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_nav_mode');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
