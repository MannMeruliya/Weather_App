import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:skyscrapper/provider/weather_provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherProvider>(context).getData();
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: Color(0xffa6b7fd),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 620,
              decoration: BoxDecoration(
                color: Color(0xffcdd1fc),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/2.json"),
                  Align(
                    alignment: Alignment(-0.8, 0.2),
                    child: Text(
                      "${provider.foreList.first.code}°",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4b53df),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.7, -0.1),
                    child: Text(
                      "${provider.foreList.first.text}°",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4b53df),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
