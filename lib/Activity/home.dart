import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchControler =  TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("This is init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set State called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("widget distroyd");
  }
  

  @override
  Widget build(BuildContext context) {
    var city_name = ["Dhaka", "Rangpur", "Rajsahi", "Comilla","Gaibandha"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = ((info['temp_value']).toString()).substring(0, 5);
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String airSpeed = ((info['air_speed_value']).toString()).substring(0, 3);
    String des = info['des_value'];
    // print(icon);
    // debugShowChecked
    return Scaffold(
      // debugShowCheckedModeBanner
      resizeToAvoidBottomInset: false,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.blue,
      //   ),
      // ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: NewGradientAppBar(
            gradient: LinearGradient(colors: [
              Colors.cyan,
              Colors.pink,
            ], begin: Alignment.topRight, end: Alignment.bottomCenter),
          )),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // stops: [
                //   0.1,
                //   0.5,
                //   0.8
                // ],
                colors: [
              Colors.blue,
              Colors.pinkAccent,
              // Colors.greenAccent
            ])),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/loading", arguments: {
                        "searchText": searchControler.text,
                      });
                    },
                    child: Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchControler,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.network(
                            "http://openweathermap.org/img/wn/$icon@2x.png"),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "$des",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "In $getcity",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: EdgeInsets.all(26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(WeatherIcons.thermometer),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$temp",
                              style: TextStyle(
                                fontSize: 90,
                              ),
                            ),
                            Text("C",
                                style: TextStyle(
                                  fontSize: 30,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    padding: EdgeInsets.all(26),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.day_windy),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "$airSpeed",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text("km/hr")
                      ],
                    ),
                    height: 200,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    padding: EdgeInsets.all(26),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.humidity),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "$hum",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text("percent")
                      ],
                    ),
                    height: 200,
                  ),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.all(50),
                child: Column(
                  children: [
                    Text("Made By Arif & Aion"),
                    Text("Data Provide By Openweathermap.org")
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
