import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_notifier_riverpod/application/weather_notifier.dart';
import 'package:weather_notifier_riverpod/weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return FakeWeatherRepository();
});

final weatherNotifierProvider = StateNotifierProvider(
  (ref) => WeatherNotifier(ref.watch(weatherRepositoryProvider)),
);
