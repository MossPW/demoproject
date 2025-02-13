import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchApiAnswer extends StatefulWidget {
  const FetchApiAnswer({super.key});

  @override
  State<FetchApiAnswer> createState() => _FetchApiAnswerState();
}

class _FetchApiAnswerState extends State<FetchApiAnswer> {
  List<User> listUser = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));
      if (response.statusCode == 200) {
        // แปลง JSON String เป็น List ของ Object
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          listUser = jsonList.map((item) => User.fromJson(item)).toList();
        });
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Simple API Call")),
        body: ListView.separated(
          itemCount: listUser.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text('${listUser[index].id}'),
              title: Text(listUser[index].name),
              subtitle: Text(listUser[index].email),
              trailing: Text('(${listUser[index].username})'),
            );
          },
        ));
  }
}

// Model Class
class User {
  final int id;
  final String name;
  final String username;
  final String email;

  // Constructor
  User(this.id, this.name, this.username, this.email);

  // แปลง JSON เป็น Object
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'];

  // แปลง Object เป็น JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
    };
  }
}
