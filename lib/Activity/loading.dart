import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String? Temperature = "Loading";

  // String? location;
  String? city = "dhaka";
  String? temp;
  String? humidity;
  String? airSpeed;
  String? description;
  String? main;
  String? icon;

  void startapp(String? city) async {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp;
    humidity = instance.humidity;
    airSpeed = instance.air_speed;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": humidity,
        "air_speed_value": airSpeed,
        "des_value": description,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });

    // setState(() {
    //   Temperature = instance.temp;
    // });
    // print(instance.air_speed);
    // print(instance.description);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map info = ModalRoute.of(context)?.settings.arguments as Map;
    //Map<String, dynamic> info = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic >;
    Map<String,String> info={};
    if (info == null && info.isEmpty) {
      city = info['searchText'];
    }
    

    // if(info.entries.isNotEmpty){
    //    city = info['searchText'];
    // }


    //if (info.isNotEmpty ?? false)
    // Map<String, dynamic> search = ModalRoute.of(context).settings.arguments as Map;
    //   if (search== false ) {
    //     city = search['searchText'];
    //   }
    startapp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png", height: 240, width: 240),
            Text(
              "Weather App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              "Made By Arif & Aion",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),

            // ElevatedButton.icon(
            //   onPressed: () {
            //     Navigator.pushNamed(context, "/home");
            //   },
            //   icon: Icon(Icons.add_to_home_screen),
            //   label: Text("Loading"),
            // )
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
/* //Text("data")*/
          /* Column(
          children: [
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              icon: Icon(Icons.add_to_home_screen),
              label: Text("Go TO HOme"),
            )
          ],
        ),*/
        //IconButton(
            //onPressed: () {
            // Navigator.pushNamed(context, "/home");
            // },
            //icon: Icon(Icons.add_to_home_screen),
            //label: Text("data"),