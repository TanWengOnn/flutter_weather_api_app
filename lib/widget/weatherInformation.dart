import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weatherModel.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({Key? key, required this.weatherModel}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.blueGrey,
      elevation: 50,
      child: Container(
        width: 300,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Text("${weatherModel.name}", style: TextStyle(fontSize: 40, color: Colors.white),),
            Image.network("http://openweathermap.org/img/w/${weatherModel.weather.first.icon}.png"),
            const SizedBox(height: 20,),
            Text("Current Temp: ${weatherModel.main.temp}°C", style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 20,),
            Text("Condition: ${weatherModel.weather.first.description}", style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 20,),
            Text("Min Temp: ${weatherModel.main.tempMin}, Max Temp: ${weatherModel.main.tempMax}", style: TextStyle(fontSize: 17, color: Colors.white)),
            const SizedBox(height: 20,),
            Text("Humidity: ${weatherModel.main.humidity}", style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
