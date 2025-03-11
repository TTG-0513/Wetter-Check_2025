import 'package:flutter/material.dart';
import 'package:wetter_check_2025/screens/wetter_gettorf.dart';
import 'package:wetter_check_2025/screens/wetter_kiel.dart';
import 'package:wetter_check_2025/screens/wetter_leipzig.dart';

class ButtonLine4 extends StatelessWidget {
  const ButtonLine4({
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
            icon: Icon(Icons.keyboard_double_arrow_left_outlined)),
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
            icon: Icon(Icons.arrow_circle_left)),
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
            icon: Icon(Icons.arrow_circle_left_outlined)),
      ],
    );
  }
}
