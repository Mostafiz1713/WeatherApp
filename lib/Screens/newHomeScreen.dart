import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage('assets/images/weather_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text('First'),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff7c9586),
                  ),
                  child: Text('Second'),
                ),
              ],
            ),
          ),
        ));
  }
}
