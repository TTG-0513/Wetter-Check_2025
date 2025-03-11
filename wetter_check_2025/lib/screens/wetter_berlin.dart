import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wetter_check_2025/screens/wetter_gettorf.dart';
import 'package:wetter_check_2025/screens/wetter_kiel.dart';
import 'package:wetter_check_2025/screens/wetter_leipzig.dart';

class WetterBerlin extends StatefulWidget {
  const WetterBerlin({super.key});

  @override
  State<WetterBerlin> createState() => _WetterCheckState();
}

class _WetterCheckState extends State<WetterBerlin> {
  String klima = "";
  String klima2 = "";
  String klima3 = "";
  String klima4 = "";
  String klima5 = "";

  @override
  void initState() {
    super.initState();
    fetchKlima();
  }

  fetchKlima() async {
    final response = await http.get(Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=52.5244&longitude=13.4105&hourly=temperature_2m,wind_speed_10m&current=temperature_2m,cloud_cover,apparent_temperature,relative_humidity_2m,wind_speed_10m&timezone=Europe%2FBerlin&forecast_days=1"));

    final data = jsonDecode(response.body);

    setState(() {
      klima =
          "${data["current"]["temperature_2m"]}${data["current_units"]["temperature_2m"]}";
      klima2 =
          "${data["current"]["apparent_temperature"]}${data["current_units"]["apparent_temperature"]}";
      klima3 =
          "${data["current"]["cloud_cover"]}${data["current_units"]["cloud_cover"]}";
      klima4 =
          "${data["current"]["relative_humidity_2m"]}${data["current_units"]["relative_humidity_2m"]}";
      klima5 =
          "${data["current"]["wind_speed_10m"]}${data["current_units"]["wind_speed_10m"]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Das Wetter in Berlin"),
        actions: [
          IconButton(onPressed: fetchKlima, icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.network(
                        "https://images.unsplash.com/photo-1560969184-10fe8719e047?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                  Container(
                      height: 20,
                      width: 300,
                      color: Color.fromARGB(255, 11, 166, 228),
                      child: Text(
                        'Aktuell ist die Temperatur $klima',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 20,
                      width: 300,
                      color: Color.fromARGB(255, 14, 223, 181),
                      child: Text(
                        'Aktuelle gefühlte Temperatur $klima2',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 20,
                      width: 300,
                      color: Color.fromARGB(255, 14, 223, 181),
                      child: Text(
                        'Das Wetter ist heute bewölkt zu $klima3',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 20,
                      width: 300,
                      color: Color.fromARGB(255, 14, 223, 181),
                      child: Text(
                        'Luftfeuchtigkeit $klima4',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 20,
                      width: 300,
                      color: Color.fromARGB(255, 14, 223, 181),
                      child: Text(
                        'Die Windgeschwindigkeit ist grade $klima5',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                  Row(
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
                          icon:
                              Icon(Icons.keyboard_double_arrow_left_outlined)),
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
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
