import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_api/model/user_model.dart';



class ui extends StatefulWidget {
  @override
  _uiState createState() => _uiState();
}

class _uiState extends State<ui> {

  List<User> users = [];
  
  getUserData() async {
    var response = await http.get(Uri.http('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);

    for(var e in jsonData) {
      User user = User(e['name'], e['email'], e['username']);
      users.add(user);
    }
  }
  
  @override
  Widget build(BuildContext context)  {
    getUserData();
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
              ListView.builder(
                itemCount: users.length.toInt(),
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text('name: ${users[index].name}  email: ${users[index].email} username: ${users[index].userName}'),
                  );
                },
              )
          ],
        )
      )
    );
  }
}

