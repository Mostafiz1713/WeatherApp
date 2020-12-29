import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameTextStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFFFFFFF));
  var valueTextStyle = TextStyle(fontSize: 16);
  var smallValueTextStyle = TextStyle(fontSize: 10);

  var data = "";
  var inputCity = "";
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
    getData();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var manualLocation = Text(
      "http://api.openweathermap.org/data/2.5/weather?q=&appid=c1405a9cadfda3451c4eb6c1ff2e6518");
  var locationDhaka =
      "http://api.openweathermap.org/data/2.5/weather?q=Dhaka&appid=c1405a9cadfda3451c4eb6c1ff2e6518";
  var locationRajshahi =
      "http://api.openweathermap.org/data/2.5/weather?q=Rajshahi&appid=c1405a9cadfda3451c4eb6c1ff2e6518";
  var locationLondon =
      "http://api.openweathermap.org/data/2.5/weather?q=London&appid=c1405a9cadfda3451c4eb6c1ff2e6518";

  getData({String cityName}) async {
    if (cityName.isEmpty) {
      await http
          .get(
              "http://api.openweathermap.org/data/2.5/weather?q=London&appid=c1405a9cadfda3451c4eb6c1ff2e6518")
          .then((value) {
        //print(value.body);
        setState(() {
          data = value.body;
        });
      });
    } else {
      await http
          .get(
              "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=c1405a9cadfda3451c4eb6c1ff2e6518")
          .then((value) {
        //print(value.body);
        setState(() {
          data = value.body;
        });
      });
    }

    //print("Finallllllllllllllll   $data");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Weather App"),
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                width: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.purple,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_city, size: 70),
                        title: Text(
                          data.isNotEmpty
                              ? "${jsonDecode(data)["sys"]["country"]}"
                              : "0",
                          style: nameTextStyle,
                        ),
                        subtitle: TextField(
                            controller: _controller,
                            decoration:
                                InputDecoration(hintText: "Enter Your City",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  )
                                ),
                            onSubmitted: (text) {
                              getData(cityName: text);
                            }),
                        /* Text(
                          data.isNotEmpty
                              ? "${jsonDecode(data)["name"]}"
                              : "0",
                          style: nameTextStyle,
                        ),*/
                      ),
                      Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                //data.isNotEmpty ?  "Temperature: ${((jsonDecode(data)["main"]["temp"]-32)*5)/9} C" : "0",
                                data.isNotEmpty
                                    ? "${(jsonDecode(data)["main"]["temp"] - 273).toStringAsFixed(0)}°C"
                                    : "0",
                                style: valueTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.isNotEmpty
                                        ? "${(jsonDecode(data)["main"]["temp_min"] - 273).toStringAsFixed(0)}°C"
                                        : "0",
                                    style: smallValueTextStyle,
                                  ),
                                  Text("/"),
                                  Text(
                                    data.isNotEmpty
                                        ? "${(jsonDecode(data)["main"]["temp_max"] - 273).toStringAsFixed(0)}°C"
                                        : "0",
                                    style: smallValueTextStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Pressure: ",
                    style: valueTextStyle,
                  ),
                  Text(
                    data.isNotEmpty
                        ? "${jsonDecode(data)["main"]["pressure"]} hPA"
                        : "0",
                    style: valueTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Humidity: ",
                    style: valueTextStyle,
                  ),
                  Text(
                    data.isNotEmpty
                        ? "${jsonDecode(data)["main"]["humidity"]}%"
                        : "0",
                    style: valueTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
