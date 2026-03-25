import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-states.dart';
import 'package:weatherapp/models/weather-model.dart';
import 'package:weatherapp/service/service-model.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoweatherState());
   Weathermodel? weathermodel;
  getWeather({required String cityName}) async {
    try {
      weathermodel = await weatherservice(
        Dio(),
      ).getweather(cityname: cityName);
      emit(WeatherloeadState(weathermodel!));
    } catch (e) {
      emit(WeatherFiledState());
    }
  }
}
