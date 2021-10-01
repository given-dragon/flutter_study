// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location_file.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';

const APIKEY = '6119f1abe03cee2df88396a591078c63';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
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
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    print(
        'Latitude: ${myLocation.myLatitude}    Longitude: ${myLocation.myLongitude}');
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.myLatitude}&lon=${myLocation.myLongitude}&appid=$APIKEY&units=metric');
    var weatherData = await network.getJsonData();

    Network network2 = Network(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=${myLocation.myLatitude}&lon=${myLocation.myLongitude}&appid=$APIKEY');
    var airData = await network2.getJsonData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPolutionData: airData,
      );
    }));
  }
}
