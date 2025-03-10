import 'package:flutter/material.dart';
import 'package:wetter_check_2025/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WetterCheck extends StatefulWidget {
  const WetterCheck({super.key});

  @override
  State<WetterCheck> createState() => _WetterCheckState();
}

class _WetterCheckState extends State<WetterCheck> {
  String klima = "Temperatur wird gelesen";

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Das Wetter Heute"),
          actions: [
            IconButton(
                onPressed: fetchKlima, icon: Icon(Icons.refresh_outlined))
          ],
        ),
        body: Center(
          child: Text('Aktuell ist die Temperatur in Gettorf $klima'),
        ),
      ),
    );
  }
}
