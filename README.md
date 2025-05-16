# Flutter Nav Mode

[![pub package](https://img.shields.io/pub/v/flutter_nav_mode.svg)](https://pub.dev/packages/flutter_nav_mode)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Flutter plugin that detects the Android navigation bar mode (three-button, two-button, or gesture navigation).

## Features

- Detect current Android navigation mode
- Support for all Android navigation styles:
  - Three-button navigation (back, home, recents)
  - Two-button navigation (back + home)
  - Gesture navigation
- Platform-specific implementation (Android only)
- Type-safe API using Pigeon
- Graceful fallback for unsupported devices

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_nav_mode: ^0.0.1
```

## Usage

```dart
import 'package:flutter_nav_mode/flutter_nav_mode.dart';

// Get the current navigation mode
final mode = await FlutterNavMode.instance.getNavigationMode();

// Handle different modes
switch (mode) {
  case NavBarMode.threeButtons:
    print('Using three-button navigation');
    break;
  case NavBarMode.twoButtons:
    print('Using two-button navigation');
    break;
  case NavBarMode.gesture:
    print('Using gesture navigation');
    break;
  case NavBarMode.unknown:
    print('Navigation mode could not be determined');
    break;
}
```

### Example App

Check out the [example](example) directory for a complete sample application.

## Platform Support

| Android | iOS | macOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✅    | ➖  |  ➖   | ➖  |  ➖   |   ➖    |

## Implementation Details

The plugin uses Android's `config_navBarInteractionMode` resource ID to determine the current navigation mode:

- `0`: Three-button navigation
- `1`: Two-button navigation
- `2`: Gesture navigation

If the resource is not available (which may happen on some OEM devices), the plugin defaults to `NavBarMode.unknown`.

## Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) to get started.

### Development Setup

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter pub run pigeon --input pigeons/nav_mode_api.dart` to generate platform channel code
4. Test your changes with the example app

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## References

- [Edge-to-edge design (Android Developers)](https://developer.android.com/design/ui/mobile/guides/layout-and-content/edge-to-edge)
- [Pigeon package](https://pub.dev/packages/pigeon)
- [Flutter plugin development](https://docs.flutter.dev/development/packages-and-plugins/developing-packages)
