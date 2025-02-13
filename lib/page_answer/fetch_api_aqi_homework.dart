import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchApiAQIHomeWork extends StatefulWidget {
  const FetchApiAQIHomeWork({super.key});

  @override
  State<FetchApiAQIHomeWork> createState() => _FetchApiAQIHomeWorkState();
}

class _FetchApiAQIHomeWorkState extends State<FetchApiAQIHomeWork> {
  Aqi? aqiData;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoaded = false;
    });
    try {
      var response = await http.get(Uri.parse(
          'https://api.waqi.info/feed/here/?token=4c7ed0daa3dfbbee48ca6c4e8e7e10dfd34af92f'));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          aqiData = Aqi.fromJson(jsonData['data']);
          isLoaded = true;
        });
      }
    } catch (e) {
      print('$e');
      setState(() {
        isLoaded = true;
      });
    }
  }

  Color getAqiScaleColor(int aqi) {
    if (aqi <= 50) {
      return Colors.green;
    } else if (aqi <= 100) {
      return Colors.amberAccent;
    } else if (aqi <= 150) {
      return Colors.orange;
    } else if (aqi <= 200) {
      return Colors.red;
    } else if (aqi <= 300) {
      return Colors.purple;
    } else {
      return Colors.brown;
    }
  }

  String getAqiScale(int aqi) {
    if (aqi <= 50) {
      return "Good";
    } else if (aqi <= 100) {
      return "Moderate";
    } else if (aqi <= 150) {
      return "Unhealthy for Sensitive Groups";
    } else if (aqi <= 200) {
      return "Unhealthy";
    } else if (aqi <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Air Quality Index (AQI)"),
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey),
        body: isLoaded
            ? Column(
                children: [
                  Text(aqiData?.city ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                      )),
                  Container(
                    height: 185,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: getAqiScaleColor(aqiData?.aqi ?? 0)),
                    width: double.infinity,
                    child: Center(
                      child: Text('${aqiData?.aqi ?? 0}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 96,
                              color: Colors.white)),
                    ),
                  ),
                  Column(
                    children: [
                      Text(getAqiScale(aqiData?.aqi ?? 0),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: getAqiScaleColor(aqiData?.aqi ?? 0))),
                      Text('temperature: ${aqiData?.temperature ?? 0.0}°C',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        fetchData();
                      },
                      child: const Text(
                        'Refresh',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            : const Center(child: CircularProgressIndicator()));
  }
}

// Model Class
class Aqi {
  final int aqi;
  final String city;
  final double temperature;

  // Constructor
  Aqi(this.aqi, this.city, this.temperature);

  // แปลง JSON เป็น Object
  Aqi.fromJson(Map<String, dynamic> json)
      : aqi = json['aqi'],
        city = json['city']['name'],
        temperature = json['iaqi']['t']['v'];

  // แปลง Object เป็น JSON Map
  Map<String, dynamic> toJson() {
    return {
      'aqi': aqi,
      'city': city,
      'temperature': temperature,
    };
  }
}
