import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Column(children: [
        SizedBox(
          width: double.maxFinite,
          child: BoxedIcon(
            WeatherIcons.day_cloudy,
          ),
        )
      ]),
    );
  }
}
