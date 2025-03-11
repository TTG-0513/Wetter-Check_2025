import 'package:flutter/material.dart';
import 'package:wetter_check_2025/screens/wetter_berlin.dart';
import 'package:wetter_check_2025/screens/wetter_kiel.dart';
import 'package:wetter_check_2025/screens/wetter_leipzig.dart';

class ButtonLine1 extends StatelessWidget {
  const ButtonLine1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Kiel"),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WetterKiel(),
                ),
              );
            },
            icon: Icon(Icons.arrow_circle_right_outlined)),
        Text("Leipzig"),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WetterLeipzig(),
                ),
              );
            },
            icon: Icon(Icons.arrow_circle_right)),
        Text("Berlin"),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WetterBerlin(),
                ),
              );
            },
            icon: Icon(Icons.keyboard_double_arrow_right_outlined)),
      ],
    );
  }
}
