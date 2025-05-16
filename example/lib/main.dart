import 'package:flutter/material.dart';
import 'package:flutter_nav_mode/flutter_nav_mode.dart';

void main() {
  runApp(const MyApp());
}

/// Example app demonstrating the Flutter Nav Mode plugin.
class MyApp extends StatelessWidget {
  /// Creates a new [MyApp] instance.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Nav Mode Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MyHomePage(),
  );
}

/// Home page showing the current navigation mode.
class MyHomePage extends StatefulWidget {
  /// Creates a new [MyHomePage] instance.
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NavBarMode? _mode;

  @override
  void initState() {
    super.initState();
    _checkMode();
  }

  Future<void> _checkMode() async {
    final mode = await FlutterNavMode.instance.getNavigationMode();
    setState(() => _mode = mode);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Navigation Mode Demo'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Current Navigation Mode:',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16),
          if (_mode == null)
            const CircularProgressIndicator()
          else
            Text(
              _mode.toString().split('.').last,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 32),
          ElevatedButton(onPressed: _checkMode, child: const Text('Refresh')),
        ],
      ),
    ),
  );
}
