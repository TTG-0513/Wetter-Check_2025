import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wetter_check_2025/backgrund_wetter_app.dart';

class WetterCheck extends StatefulWidget {
  const WetterCheck({super.key});

  @override
  State<WetterCheck> createState() => _WetterCheckState();
}

class _WetterCheckState extends State<WetterCheck> {
  String klima = "";
  String klima2 = "";

  @override
  void initState() {
    super.initState();
    fetchKlima();
  }

  fetchKlima() async {
    final response = await http.get(Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=54.4&longitude=9.9833&current=temperature_2m,apparent_temperature&hourly=temperature_2m,apparent_temperature,precipitation_probability,rain,weather_code&daily=temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min&forecast_days=1"));

    final data = jsonDecode(response.body);

    setState(() {
      klima = "${data["current"]["temperature_2m"]}";
      klima2 = "${data["current"]["apparent_temperature"]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Das Wetter Heute"),
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
                        "https://images.unsplash.com/photo-1730371339286-76d0cd5d1f6f?q=80&w=1635&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                  Container(
                      height: 20,
                      width: 300,
                      color: Color.fromARGB(255, 11, 166, 228),
                      child: Text(
                        'Aktuell ist die Temperatur in Gettorf $klima',
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
                ]),
          ),
        ],
      ),
    );
  }
}
