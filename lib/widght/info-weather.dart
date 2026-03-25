import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather-model.dart';

class Infoweather extends StatelessWidget {
  Infoweather({super.key, required this.weather});

  Weathermodel weather;
  @override
  Widget build(BuildContext context) {
    var weathermodel = BlocProvider.of<GetWeatherCubit>(context).weathermodel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherColor(weathermodel?.condthion),
            getWeatherColor(weathermodel?.condthion)[300]!,
            getWeatherColor(weathermodel?.condthion)[50]!,
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weathermodel!.cityname,
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "updated at ${weathermodel.date.hour}:${weathermodel.date.minute}",
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https:${weathermodel.image!}"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  weathermodel.avrage.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  Text(
                    "Max Timp : ${weathermodel.maxtimp.round()}",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Min Timp : ${weathermodel.mintimp.round()}",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            weathermodel.condthion,
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
