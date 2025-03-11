import 'package:flutter/material.dart';
import 'package:wetter_check_2025/screens/wetter_gettorf.dart';
import 'package:wetter_check_2025/widgets/backgrund_wetter_app.dart';

class WetterCheck extends StatelessWidget {
  const WetterCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Backgrund(),
          Positioned(
            top: 70,
            right: 6,
            child: Container(
              alignment: Alignment.topCenter,
              height: 380,
              width: 380,
              child: Image.network(
                  "https://images.unsplash.com/photo-1580193813605-a5c78b4ee01a?q=80&w=1530&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 90,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WetterGettorf(),
                  ),
                );
              },
              child: Text(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFFFFFFFF)),
                  "Willkommen"),
            ),
          ),
          Positioned(
              bottom: 200,
              left: 87,
              child: Text(
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color.fromARGB(255, 242, 248, 247)),
                  "zu WetterCheck 2025"))
        ],
      ),
    );
  }
}
