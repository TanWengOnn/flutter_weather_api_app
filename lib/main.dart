import 'package:flutter/material.dart';
import 'package:flutter_weather_app/states/weatherCubit.dart';
import 'pages/homePage.dart';
import 'pages/weatherDetail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomePage());
          case '/weather-detail':
            WeatherDetail data = settings.arguments as WeatherDetail;
            return MaterialPageRoute(builder: (_) => WeatherDetail(cityName: data.cityName));
        }
      },
    );
  }
}