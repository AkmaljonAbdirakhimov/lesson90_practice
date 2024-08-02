import 'package:dio/dio.dart';
import 'package:lesson90_practice/data/models/weather.dart';
import 'package:lesson90_practice/utils/app_secrets.dart';

class WeatherRepository {
  final dio = Dio();

  Future<Weather> getWeather(String city) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$weatherApiKey";
    try {
      final response = await dio.get(url);

      return Weather.fromJson(response.data);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }
}
