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
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                      child: _showIcon(state),
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

  BoxedIcon _showIcon(WeatherSuccess state) {
    final code = state.weather.weatherConditionCode!;
    BoxedIcon icon = const BoxedIcon(
      WeatherIcons.day_cloudy,
    );
    if (code ~/ 100 == 2) {
      icon = const BoxedIcon(
        WeatherIcons.thunderstorm,
      );
    }
    if (code ~/ 100 == 3) {
      icon = const BoxedIcon(
        WeatherIcons.rain_mix,
      );
    }
    if (code ~/ 100 == 5) {
      icon = const BoxedIcon(
        WeatherIcons.rain,
      );
    }
    if (code ~/ 100 == 6) {
      icon = const BoxedIcon(
        WeatherIcons.snow,
      );
    }
    if (code ~/ 100 == 7) {
      icon = const BoxedIcon(
        WeatherIcons.fog,
      );
    }
    if (code ~/ 100 == 8) {
      if (code == 800) {
        icon = const BoxedIcon(
          WeatherIcons.day_sunny,
        );
      } else {
        icon = const BoxedIcon(
          WeatherIcons.cloud,
        );
      }
    }

    return icon;
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
