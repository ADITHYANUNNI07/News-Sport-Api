import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:convert';

import 'package:news_app_api/presentation/home/weather/model/weather_model.dart';

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService({required this.apiKey});

  Future<Weather?> getWeather(String cityName) async {
    try {
      final response = await http
          .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }

  Future<String> getCurrentCity() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          throw Exception('Location permission denied.');
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      String? city = placemarks[0].locality;
      return city ?? '';
    } catch (e) {
      throw Exception('Failed to get current city: $e');
    }
  }

  Future<Weather?> getWeatherWithRetry(String cityName) async {
    Weather? weather;
    bool fetching = true;

    while (fetching) {
      try {
        weather = await getWeather(cityName);
        fetching = false; // Stop retrying once weather data is obtained
      } catch (e) {
        print('Failed to get weather data: $e');
        await Future.delayed(
            Duration(seconds: 5)); // Wait for 5 seconds before retrying
      }
    }

    return weather;
  }
}
