import 'package:weatherapp/models/weather-model.dart';

class WeatherState {}

class NoweatherState extends WeatherState {}

class WeatherloeadState extends WeatherState {
  WeatherloeadState(this.weathermodel);
  Weathermodel weathermodel;
}

class WeatherFiledState extends WeatherState {}
