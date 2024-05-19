import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_icons/weather_icons.dart';

import '../bloc/weather_bloc.dart';

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BoxedIcon(
                        WeatherIcons.day_cloudy,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${state.weather.temperature!.celsius!.round()} °C',
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Center(
                      child: Text(
                    state.weather.weatherDescription!.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ]);
          } else {
            return const Center(
              child: CircleAvatar(),
            );
          }
        },
      ),
    );
  }
}
