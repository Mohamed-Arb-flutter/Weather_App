import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-states.dart';
import 'package:weatherapp/viwes/search-viwe.dart';
import 'package:weatherapp/widght/info-weather.dart';
import 'package:weatherapp/widght/no-weather.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        //backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Searchviwe();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search, size: 30, color: Colors.black),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoweatherState) {
            return Noweather();
          } else if (state is WeatherloeadState) {
            return Infoweather(weather: state.weathermodel);
          } else {
            return Text("oops there was an error");
          }
        },
      ),
    );
  }
}
