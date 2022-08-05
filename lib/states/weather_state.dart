import 'package:flutter_weather_app/models/weatherModel.dart';

abstract class WeatherState {}

// // initialise
// class WeatherInitial

// loading
class WeatherLoading extends WeatherState {}

// loaded
class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoaded({required this.weatherModel});
}

// error
class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError({required this.errorMessage});
}
