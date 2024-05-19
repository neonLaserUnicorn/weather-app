import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FittedBox(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: BoxedIcon(
                  WeatherIcons.day_cloudy,
                ),
              ),
            ),
            Center(
              child: Text(
                '/*temperature*/',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Center(
                child: Text(
              '/*description*/',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ]),
    );
  }
}
