import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

import '../bloc/weather_bloc.dart';

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final timeForm = DateFormat('Hms');
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        buildWhen: (previous, current) => current is WeatherSuccess,
        builder: (context, state) {
          if (state is WeatherSuccess) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FittedBox(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                      child: BoxedIcon(
                        WeatherIcons.day_cloudy,
                      ),
                    ),
                  ),
                  _mainText(
                      '${state.position.latitude}, ${state.position.longitude}',
                      10),
                  _mainText(
                      '${state.weather.temperature!.celsius!.round()} °C', 40),
                  _mainText(
                      state.weather.weatherDescription!.toUpperCase(), 30),
                  _mainText(
                      'last updated: ${timeForm.format(state.weather.date!)}',
                      10)
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

  Center _mainText(String message, double size) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
            fontSize: size, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
