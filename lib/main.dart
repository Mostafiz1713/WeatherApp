import 'package:flutter/material.dart';
import 'package:weather_app/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.generateRoute,
      initialRoute: '/',
      /*home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Text(
                  data.isNotEmpty
                      ? "Location: ${jsonDecode(data)["name"]}"
                      : "Loading...",
                  style: testStyle,
                ),
                Text(
                  //data.isNotEmpty ?  "Temperature: ${((jsonDecode(data)["main"]["temp"]-32)*5)/9} C" : "Loading...",
                  data.isNotEmpty
                      ? "Temperature: ${jsonDecode(data)["main"]["temp"] - 273} C"
                      : "Loading...",
                  style: testStyle,
                ),
                Text(
                  data.isNotEmpty
                      ? "Feels Like: : ${jsonDecode(data)["main"]["feels_like"] - 273} C"
                      : "Loading...",
                  style: testStyle,
                ),
                Text(
                  data.isNotEmpty
                      ? "Min Temp: : ${jsonDecode(data)["main"]["temp_min"] - 273} C"
                      : "Loading...",
                  style: testStyle,
                ),
                Text(
                  data.isNotEmpty
                      ? "Max Temp: : ${jsonDecode(data)["main"]["temp_max"] - 273} C"
                      : "Loading...",
                  style: testStyle,
                ),
                Text(
                  data.isNotEmpty
                      ? "Pressure: : ${jsonDecode(data)["main"]["pressure"]}"
                      : "Loading...",
                  style: testStyle,
                ),
                Text(
                  data.isNotEmpty
                      ? "Humidity: : ${jsonDecode(data)["main"]["humidity"]}"
                      : "Loading...",
                  style: testStyle,
                ),
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}
