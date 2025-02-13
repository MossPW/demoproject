import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String message;
  const SecondPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Second Page ($message)'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('< Go back'),
        ),
      ),
    );
  }
}
