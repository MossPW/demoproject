import 'package:demoproject/page_answer/answer1.dart';
import 'package:demoproject/page_answer/answer2.dart';
// import 'package:demoproject/page_answer/answer2_2.dart';
import 'package:demoproject/page_answer/answer3.dart';
import 'package:demoproject/page_answer/answer4.dart';
import 'package:flutter/material.dart';

class AnswerPortal extends StatelessWidget {
  const AnswerPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Answer'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.teal[50],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Answer1(),
                  ),
                );
              },
              child: const Text('Answer1')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Answer2(),
                  ),
                );
              },
              child: const Text('Answer2')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Answer3(),
                  ),
                );
              },
              child: const Text('Answer3')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Answer4(),
                  ),
                );
              },
              child: const Text('Answer4')),
        ],
      )),
    );
  }
}
