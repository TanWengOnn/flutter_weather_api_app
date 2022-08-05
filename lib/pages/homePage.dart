import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/weatherDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState() {
    _controller = TextEditingController();

    _controller.addListener(() {
      setState(() => _isCityNameEmpty = _controller.text.isEmpty);
      // if (_controller.text == ""){
      //   _isCityNameEmpty = true;
      // }
      // else{
      //   _isCityNameEmpty = false;
      // }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: const Text(
            "Search City",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Please enter city name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  label: Text("City Name", style: TextStyle(color: Colors.white),),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Search"),
              // onPressed: () => _isCityNameEmpty ? null : print("eable"),
              onPressed: _isCityNameEmpty ? null : () {
                Navigator.pushNamed(context, "/weather-detail", arguments: WeatherDetail(cityName: _controller.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
