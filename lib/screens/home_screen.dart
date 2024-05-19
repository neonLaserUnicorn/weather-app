import 'package:flutter/material.dart';
import 'package:weather_app/widgets/background_widget.dart';
import 'package:weather_app/widgets/main_weather_widget.dart';

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
        child: Stack(
          children: [
            const BackgroundWidget(
              mainColor: Colors.blue,
              secondaryColor: Colors.green,
            ),
            MainWeatherWidget(),
          ],
        ),
      ),
    );
  }
}
