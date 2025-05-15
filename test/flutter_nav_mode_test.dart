import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_nav_mode/flutter_nav_mode.dart';
import 'package:flutter_nav_mode/flutter_nav_mode_platform_interface.dart';
import 'package:flutter_nav_mode/flutter_nav_mode_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNavModePlatform
    with MockPlatformInterfaceMixin
    implements FlutterNavModePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterNavModePlatform initialPlatform = FlutterNavModePlatform.instance;

  test('$MethodChannelFlutterNavMode is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNavMode>());
  });

  test('getPlatformVersion', () async {
    FlutterNavMode flutterNavModePlugin = FlutterNavMode();
    MockFlutterNavModePlatform fakePlatform = MockFlutterNavModePlatform();
    FlutterNavModePlatform.instance = fakePlatform;

    expect(await flutterNavModePlugin.getPlatformVersion(), '42');
  });
}
