import 'dart:convert';


import 'package:api/Models/Weathh.dart';
import 'package:http/http.dart' as http;





class WeatherData {
  static Future<Weathh> getData() async {
    String apiUrl = "api.openweathermap.org/data/2.5/weather?q=Aligarh,India&APPID=889eac30334c9045c3bf7a0bc115e999&units=metric";
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
