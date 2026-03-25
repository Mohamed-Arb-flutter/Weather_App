import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather-model.dart';

final dio = Dio();

class weatherservice {
  final Dio dio;
  final String baseurl = 'https://api.weatherapi.com/v1';
  final String apikey = '0c14f6a06bf348cda7300149261102';
  String error = 'city name not fond';
  weatherservice(this.dio);
  Future<Weathermodel> getweather({required String cityname}) async {
    try {
      Response response = await dio.get(
        '$baseurl/forecast.json?key=$apikey&q=$cityname&days=1&aqi=no&alerts=no',
      );
      Weathermodel weathermodel = Weathermodel.fromjeson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String erromassage =
          e.response?.data['error']['message'] ??
          "ops ther was an error try leter ";
      throw Exception(erromassage);
    } catch (e) {
      throw Exception('ops ther was an error try leter ');
    }
  }
}
