import 'package:flutter/material.dart';

class Backgrund extends StatelessWidget {
  const Backgrund({super.key, this.child, this.decoration, this.alignment});

  final Widget? child;
  final Decoration? decoration;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/Image/BackgrundWetterApp.png"),
        ),
      ),
      height: double.infinity,
      width: double.infinity,
    );
  }
}
