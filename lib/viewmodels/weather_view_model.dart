import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

import '../services/api.dart';
import '../locator.dart';

class WeatherViewModel extends ChangeNotifier {
  final _api = locator<WeatherAPI>();

  WeatherModel _weatherModel;
  WeatherModel get weatherModel => _weatherModel;

  Future getWeather() async {
    var weatherREQ = await _api.loadWeather();

    if (weatherREQ is String) {
      // show error
    } else {
      _weatherModel = weatherREQ;
    }
    notifyListeners();
  }
}
