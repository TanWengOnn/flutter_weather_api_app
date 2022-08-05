import '../models/weatherModel.dart';
import 'package:flutter_weather_app/services/weatherService.dart';
import 'package:flutter_weather_app/states/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class  WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());
  
  Future<void> fetchWeather(String cityName) async {
    WeatherService weatherService = WeatherService();
    emit(WeatherLoading());
    
    try {
      WeatherModel weatherModel = await weatherService.fetchWeatherInformation(cityName);
      emit(WeatherLoaded(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherError(errorMessage: e.toString()));
    }
  }
}