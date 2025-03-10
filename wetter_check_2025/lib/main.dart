import 'package:flutter/material.dart';

void main() {
  runApp(const WetterCheck());
}

class WetterCheck extends StatelessWidget {
  const WetterCheck({super.key});

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
