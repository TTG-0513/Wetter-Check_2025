import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wetter_check_2025/widgets/button_line1.dart';

class WetterGettorf extends StatefulWidget {
  const WetterGettorf({super.key});

  @override
  State<WetterGettorf> createState() => _WetterCheckState();
}

class _WetterCheckState extends State<WetterGettorf> {
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
        "https://api.open-meteo.com/v1/forecast?latitude=54.4&longitude=9.9833&hourly=temperature_2m,wind_speed_10m&current=temperature_2m,cloud_cover,apparent_temperature,relative_humidity_2m,wind_speed_10m&timezone=Europe%2FBerlin&forecast_days=1"));

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
        title: Text("Das Wetter in Gettorf"),
        actions: [
          IconButton(onPressed: fetchKlima, icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Image.network(
                    "https://plus.unsplash.com/premium_photo-1666721922432-49f64a5db919?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              ),
              Container(
                  height: 20,
                  width: 300,
                  color: Color.fromARGB(255, 214, 35, 74),
                  child: Text(
                    'Aktuell ist die Temperatur $klima',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
              Container(
                  height: 20,
                  width: 300,
                  color: Color.fromARGB(255, 206, 156, 50),
                  child: Text(
                    'Aktuelle gefühlte Temperatur $klima2',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
              Container(
                  height: 20,
                  width: 300,
                  color: Color.fromARGB(255, 212, 212, 27),
                  child: Text(
                    'Das Wetter ist heute bewölkt zu $klima3',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
              Container(
                  height: 20,
                  width: 300,
                  color: Color.fromARGB(255, 123, 218, 121),
                  child: Text(
                    'Luftfeuchtigkeit $klima4',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
              Container(
                  height: 20,
                  width: 300,
                  color: Color.fromARGB(255, 86, 124, 221),
                  child: Text(
                    'Die Windgeschwindigkeit ist grade $klima5',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
              ButtonLine1()
            ]),
      ),
    );
  }
}
