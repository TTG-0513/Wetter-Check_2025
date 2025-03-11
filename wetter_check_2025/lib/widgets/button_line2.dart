import 'package:flutter/material.dart';
import 'package:wetter_check_2025/screens/wetter_berlin.dart';
import 'package:wetter_check_2025/screens/wetter_gettorf.dart';
import 'package:wetter_check_2025/screens/wetter_leipzig.dart';

class ButtonLine2 extends StatelessWidget {
  const ButtonLine2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Gettorf"),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WetterGettorf(),
                ),
              );
            },
            icon: Icon(Icons.arrow_circle_left_outlined)),
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
            icon: Icon(Icons.arrow_circle_right_outlined)),
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
            icon: Icon(Icons.arrow_circle_right_sharp)),
      ],
    );
  }
}
