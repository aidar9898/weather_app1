// ignore: unused_import
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uricall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=88b52dfa0af8451a91c153009220910&q=bishkek&aqi=no');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
