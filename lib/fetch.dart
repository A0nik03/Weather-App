import 'dart:convert';


import 'package:api/Models/Weathh.dart';
import 'package:http/http.dart' as http;





class WeatherData {
  static Future<Weathh> getData(String city) async {
    String api = "";
    String apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=$city,India&APPID=$api&units=metric";
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return Weathh.fromJson(data);
    }
    else{
      return Weathh.fromJson(data);
    }

  }
}
