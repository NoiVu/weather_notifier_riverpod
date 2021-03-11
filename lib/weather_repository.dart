import 'dart:math';

import 'package:weather_notifier_riverpod/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fectchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  double cachedTempCelsius;

  @override
  Future<Weather> fectchWeather(String cityName) {
    return Future.delayed(Duration(seconds: 1), () {
      final random = Random();
      if (random.nextBool()) {
        throw NetworkException();
      }

      cachedTempCelsius = 20 + random.nextInt(15) + random.nextDouble();

      return Weather(cityName: cityName, temperatureCelius: cachedTempCelsius);
    });
  }
}

class NetworkException implements Exception {}
