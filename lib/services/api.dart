import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';



const API_KEY = '';
const CITY_NAME = 'Enugu';
const URL = 'https://api.openweathermap.org/data/2.5/forecast/daily';

class WeatherAPI {
   Future<WeatherModel> loadWeather() async {
    try {
      var response =
          await http.get('$URL?q=$CITY_NAME&appid=$API_KEY&cnt=7&units=metric');

      if (response.body != null && response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

