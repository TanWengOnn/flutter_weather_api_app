import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/states/weatherCubit.dart';
import 'package:flutter_weather_app/states/weather_state.dart';
import 'package:flutter_weather_app/widget/weatherInformation.dart';
import 'package:flutter_weather_app/models/weatherModel.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({Key? key, required this.cityName}) : super(key: key);

  final String cityName;
  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)..fetchWeather(cityName);

    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text("Weather Detail"),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          bloc: cubit,
          builder: (context, state) {
            if(state is WeatherLoading) {
              return CircularProgressIndicator();
            }

            if(state is WeatherLoaded) {
              return WeatherInformation(weatherModel: state.weatherModel);
            }

            return Text(state is WeatherError ? state.errorMessage : "");

          },
        ),
      ),
    );
  }
}
