import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:weather_app/model/model.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;
  final dynamic parseAirPolutionData;
  WeatherScreen({this.parseWeatherData, this.parseAirPolutionData});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  String cityName = '';
  int temp = 0;
  Widget w_icon = SvgPicture.asset(
    'svg/climacon-sun.svg',
    color: Colors.black87,
  );

  String des = '';
  int aqi = 0;
  double pm2_5 = 0.0;
  double pm10 = 0.0;
  var date = DateTime.now();
  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirPolutionData);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    double temp2 = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    temp = temp2.round(); //round는 반올림, int반환 //toInt()를 써도 결과는 같음
    cityName = weatherData['name'];
    des = weatherData['weather'][0]['description'];
    aqi = airData['list'][0]['main']['aqi'];
    pm2_5 = airData['list'][0]['components']['pm2_5'];
    pm10 = airData['list'][0]['components']['pm10'];
    print(cityName + '    ' + '$temp');
    print(pm2_5);
    w_icon = model.getWeatherIcon(condition);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0, //음영
        title: Text('Weather'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.near_me),
          iconSize: 30.0,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching),
            iconSize: 30.0,
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            //지역표시 컨테이너
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 150.0,
                              ),
                              Text(cityName,
                                  style: GoogleFonts.lato(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Row(
                                children: [
                                  TimerBuilder.periodic((Duration(minutes: 1)),
                                      builder: (context) {
                                    print(getSystemTime());
                                    return Text(
                                      getSystemTime(),
                                      style: GoogleFonts.lato(
                                          fontSize: 16.0, color: Colors.white),
                                    );
                                  }),
                                  Text(
                                    DateFormat(' - EEEE').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                  Text(
                                    DateFormat(' - d MMM, yyy').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                          //SizedBox(height: 100.0),
                          Column(
                            //온도표시 컨테이너
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$temp\u2103',
                                style: GoogleFonts.lato(
                                    fontSize: 100.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  w_icon,
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(des,
                                      style: GoogleFonts.lato(
                                          fontSize: 16.0, color: Colors.white)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      //하단 컨테이너
                      children: [
                        Divider(
                          height: 15.0,
                          thickness: 2.0,
                          color: Colors.white30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              //대기질 지수
                              children: [
                                Text('AQI(대기질 지수)',
                                    style: GoogleFonts.lato(
                                        fontSize: 14.0, color: Colors.white)),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                model.getAirImage(aqi),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                model.getAirCondition(aqi),
                              ],
                            ),
                            Column(
                              //미세먼지
                              children: [
                                Text('미세먼지',
                                    style: GoogleFonts.lato(
                                        fontSize: 14.0, color: Colors.white)),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text('$pm2_5',
                                    style: GoogleFonts.lato(
                                        fontSize: 24.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text('㎍/㎥',
                                    style: GoogleFonts.lato(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Column(
                              //초미세먼지
                              children: [
                                Text('초미세먼지',
                                    style: GoogleFonts.lato(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text('$pm10',
                                    style: GoogleFonts.lato(
                                        fontSize: 24.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text('㎍/㎥',
                                    style: GoogleFonts.lato(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
