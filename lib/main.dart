import 'package:demoproject/api_test/simple_aip_call.dart';
import 'package:demoproject/homepage.dart';
import 'package:demoproject/page_answer/fetch_api_aqi_homework.dart';
import 'package:demoproject/page_answer/registration_form.dart';
import 'package:demoproject/page_navigator_bar/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FetchApiAQIHomeWork());
  }
}
