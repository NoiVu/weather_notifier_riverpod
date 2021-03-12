import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_notifier_riverpod/weather.dart';
import 'package:weather_notifier_riverpod/weather_repository.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitail extends WeatherState {
  const WeatherInitail();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherLoaded &&
          runtimeType == other.runtimeType &&
          weather == other.weather;

  @override
  int get hashCode => weather.hashCode;

  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class WeatherNotifier extends StateNotifier<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherNotifier(this._weatherRepository) : super(WeatherInitail());

  Future<void> getWeather(String cityName) async {
    try {
      state = WeatherLoading();
      final weather = await _weatherRepository.fectchWeather(cityName);
      state = WeatherLoaded(weather);
    } on NetworkException {
      state = WeatherError('Couldn\'t fetch weather. Is the device online?');
    }
  }
}
