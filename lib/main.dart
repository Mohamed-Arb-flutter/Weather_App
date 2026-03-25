import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-states.dart';
import 'package:weatherapp/viwes/home-page.dart';

void main() {
  runApp(const weatherapp());
}

class weatherapp extends StatelessWidget {
  const weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false, // لضمان عمل primarySwatch بشكل تقليدي
                primarySwatch: getWeatherColor(
                  BlocProvider.of<GetWeatherCubit>(
                    context,
                  ).weathermodel?.condthion,
                ),
              ),
              home: homepage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  switch (condition?.toLowerCase().trim() ?? "") {
    case "sunny":
    case "clear":
      return Colors.orange;

    case "partly cloudy":
      return Colors.lightBlue;

    case "cloudy":
    case "overcast":
      return Colors.blueGrey;

    case "mist":
    case "fog":
      return Colors.grey;

    case "thunder":
      return Colors.deepPurple;

    case "snow":
    case "blizzard":
      return Colors.cyan;

    case "sleet":
    case "ice":
    case "freezing":
      return Colors.teal;

    case "rain":
    case "drizzle":
    case "shower":
      return Colors.blue;

    default:
      return Colors.brown;
  }
}
