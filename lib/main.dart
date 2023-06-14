import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skyscrapper/screen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MyHomePage(),
        'homescreen': (context) => homescreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff999ff8),
      body: Stack(
        alignment: Alignment(0, 0.3),
        children: [
          Container(
            alignment: Alignment(0, 0.2),
            child: Text(
              "Weather",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
          Container(
            alignment: Alignment(0, 0.3),
            child: Text(
              "Forecasts",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
          Container(
            alignment: Alignment(0, -0.4),
            child: Lottie.asset("assets/3.json", width: 330),
          ),
          Container(
              alignment: Alignment(0, 0.5),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('homescreen');
                  },
                  child: Text("Get Start"))),
        ],
      ),
    );
  }
}
