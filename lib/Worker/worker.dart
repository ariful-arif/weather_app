//..class- diffrent,method
//..instance/object- diffrent data
import 'package:http/http.dart';
import 'dart:convert';

class worker {
// constructor
  String? location;
  worker({this.location}) {
    location = this.location;
  }

  
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  //method

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7417eeadb056b6ac84db6c4abe1aed92"));
      Map data = jsonDecode(response.body);
      print(data);

      // getting Temp,Humidity
      Map temp_data = data['main'];
      String gethumidity = temp_data['humidity'].toString();
      double gettemp = temp_data['temp'] - 273.15;

      // getting air_speed
      Map wind = data['wind'];
      double getair_speed = wind['speed'] / 0.27777777777778;

// getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getmain_des = weather_main_data['main'];
      String getdesc = weather_main_data['description'];
      
      // print(icon);

      // assining value
      temp = gettemp.toString(); //c
      humidity = gethumidity; //%
      air_speed = getair_speed.toString(); //km/hr
      description = getdesc;
      main = getmain_des;
      icon = weather_main_data["icon"].toString();
      // print(weather_data);
      // print(weather_main_data['main']);
      // double temp = temp_data['temp'];
      // print(temp);
    } catch (e) {
      temp = "No Data";
      humidity = "No Data";
      air_speed = "No Data";
      description = "No Data";
      main = "No Data";
      icon = "01n";
    }
  }
}
