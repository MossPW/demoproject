import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple Layout'),
        ), //AppBar
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello World!'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.black, size: 30),
                SizedBox(width: 10),
                Icon(Icons.favorite, color: Colors.black, size: 30),
              ],
            ), //Row
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Press Me'),
            ), // ElevatedButton
          ],
        ) //Column
        ); // Scaffold
  }
}
