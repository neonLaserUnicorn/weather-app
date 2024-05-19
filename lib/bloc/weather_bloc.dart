import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/constants.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      print('event: $event');
      emit(WeatherLoading());
      try {
        final WeatherFactory wf = WeatherFactory(g_apiKey);
        final pos = await Geolocator.getCurrentPosition();
        final weather =
            await wf.currentWeatherByLocation(pos.latitude, pos.longitude);
        emit(WeatherSuccess(weather, pos));
      } catch (e) {
        emit(WeatherError());
      }
    });
  }
}
