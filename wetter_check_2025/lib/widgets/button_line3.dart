import 'package:flutter/material.dart';
import 'package:wetter_check_2025/screens/wetter_berlin.dart';
import 'package:wetter_check_2025/screens/wetter_gettorf.dart';
import 'package:wetter_check_2025/screens/wetter_kiel.dart';

class ButtonLine3 extends StatelessWidget {
  const ButtonLine3({
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
            icon: Icon(Icons.arrow_circle_right_outlined)),
      ],
    );
  }
}
