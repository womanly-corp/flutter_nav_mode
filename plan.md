Your task is to create a Flutter package that exposes the Android navigation mode (three-button, two-button, gesture) to Dart using Pigeon.

## 1. Project Setup

**a. Add dependencies in `pubspec.yaml`:**

```yaml
dependencies:
  flutter:
    sdk: flutter
  plugin_platform_interface: ^2.1.8

dev_dependencies:
  lints: ^5.1.1
  pigeon: ^25.3.0
  xsoulspace_lints: ^0.0.14
```

- **Tip:** Use `xsoulspace_lints` for strict code quality.
- **Impact:** Ensures maintainability and consistency.

---

## 2. Define the Pigeon API

**a. Create `pigeons/nav_mode_api.dart`:**

```dart
enum NavBarMode {
  threeButtons,
  twoButtons,
  gesture,
  unknown,
}

@HostApi()
abstract class NavBarApi {
  NavBarMode getNavBarMode();
}
```

- **Tip:** Use clear, future-proof enum names.
- **Impact:** Simple, robust API for Dart/Android.

**b. Configure Pigeon codegen:**

- Add a script in `pubspec.yaml` or a shell script:

```yaml
# pubspec.yaml
pigeon:
  input: pigeons/nav_mode_api.dart
  dart_out: lib/src/nav_mode_api.g.dart
  kotlin_out: android/src/main/kotlin/com/example/flutter_nav_mode/NavModeApi.g.kt
  kotlin_package: com.example.flutter_nav_mode
```

- **Tip:** Keep generated code out of version control.

---

## 3. Implement Android Native Logic

**a. In generated Kotlin file, implement:**

```kotlin
override fun getNavBarMode(): NavBarMode {
    val resources = context.resources
    val resId = resources.getIdentifier("config_navBarInteractionMode", "integer", "android")
    val mode = if (resId > 0) resources.getInteger(resId) else 0
    return when (mode) {
        0 -> NavBarMode.THREE_BUTTON
        1 -> NavBarMode.TWO_BUTTON
        2 -> NavBarMode.GESTURE
        else -> NavBarMode.UNKNOWN
    }
}
```

- **Tip:** Fallback to `THREE_BUTTON` if resource is missing.
- **Impact:** Handles OEM quirks, avoids crashes.

---

## 4. Wire Up Pigeon

**a. Generate code:**

```sh
flutter pub run pigeon --input pigeons/nav_mode_api.dart
```

**b. Register API in plugin’s main class:**

```kotlin
NavBarApi.setUp(binaryMessenger, NavBarApiImpl(context))
```

- **Tip:** Register in `onAttachedToEngine`.
- **Impact:** Ensures API is available as soon as plugin is loaded.

---

## 5. Dart API

**a. Expose a Dart method:**

```dart
Future<NavBarMode> getNavBarMode() async {
  final api = NavBarApi();
  return await api.getNavBarMode();
}
```

- **Tip:** Document enum mapping in code comments.
- **Impact:** Clean, predictable Dart interface.

---

## 6. Testing

**a. Dart-side:**

- Mock platform channel for unit tests.
- Example:

```dart
test('returns gesture mode', () async {
  // Mock method channel to return NavBarMode.gesture
});
```

**b. Android-side:**

- Test on emulators/devices with different nav modes.
- **Tip:** Use CI for automated tests.

---

## 7. Documentation

**a. README.md:**

- What is Android nav mode?
  - [Edge-to-edge design, Android Docs](https://developer.android.com/design/ui/mobile/guides/layout-and-content/edge-to-edge)
- Usage example:

```dart
final mode = await getNavBarMode();
print(mode); // NavBarMode.gesture, etc.
```

- Supported platforms: Android only.
- Limitations: Not all OEMs expose the resource.

**b. API docs:**

- Document enum values and method.

---

**References:**

- [Edge-to-edge design, Android Docs](https://developer.android.com/design/ui/mobile/guides/layout-and-content/edge-to-edge)
- [Pigeon package](https://pub.dev/packages/pigeon)
