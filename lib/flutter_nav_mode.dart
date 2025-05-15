
import 'flutter_nav_mode_platform_interface.dart';

class FlutterNavMode {
  Future<String?> getPlatformVersion() {
    return FlutterNavModePlatform.instance.getPlatformVersion();
  }
}
