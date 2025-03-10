import 'package:flutter/material.dart';

void main() {
  runApp(const WetterCheck());
}

class WetterCheck extends StatefulWidget {
  const WetterCheck({super.key});

  @override
  State<WetterCheck> createState() => _WetterCheckState();
}

class _WetterCheckState extends State<WetterCheck> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
