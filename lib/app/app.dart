import 'package:flutter/material.dart';

import '../ui/export_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoScreen(),
    );
  }
}
