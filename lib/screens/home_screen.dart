import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/widgets/background_widget.dart';
import 'package:weather_app/widgets/main_weather_widget.dart';

import '../bloc/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Stack(
          children: [
            BackgroundWidget(
              mainColor: Colors.blue,
              secondaryColor: Colors.green,
            ),
            MainWeatherWidget(),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          context.read<WeatherBloc>().add(GetWeather());
        },
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
