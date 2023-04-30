import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static Page<void> page() => const MaterialPage<void>(child: MainPage());

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
    );
  }
}
