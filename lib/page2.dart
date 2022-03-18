// import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as api;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String responseFromServer = "";
  @override
  void initState() {
    super.initState();
    print("1. init state called");
    fetchDataFromSerer();
  }

  fetchDataFromSerer() async {
    print({"fetch data from server"});
    final url = "https://jsonplaceholder.typicode.com/posts";
    final uri = Uri.parse(url);
    final response = await api.get(uri, headers: {
      "contain-Type": "application/json",
      "Authorization": "Bearer fdfvdfvfvfvfvddre"
    });

//       final poseResponse=await api.post(
//       uri,body:{
// "email":"dfdf@email.com",

//       },

//       );
    print(response.body);
    responseFromServer = response.body;
    setState(() {});

    // final decodedResponse = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    print("build called");

    return Scaffold(
      body: Column(children: [Text(responseFromServer)]),
    );
  }
}
