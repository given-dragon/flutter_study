// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text('Get My Location'),
        ),
      ),
    );
  }

  void getLocation() async {
    try {
      Position myPos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(myPos);
    } catch (e) {
      print('error: inter accessing');
    }
  }

  void fetchData() async {
    Uri link = Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    http.Response response = await http.get(link);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson);
      var wind = jsonDecode(jsonData)['wind']['speed'];
      print(wind);
      var id = jsonDecode(jsonData)['id'];
      print(id);
    }
    print(response.body);
  }
}
