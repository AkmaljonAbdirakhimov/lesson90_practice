import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @JsonKey(name: 'name') required String city,
    @JsonKey(name: 'weather', fromJson: weatherFromJson)
    required String weather,
    @JsonKey(name: 'main', fromJson: temperatureFromJson)
    required int temperature,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);
}

String weatherFromJson(List<dynamic> json) {
  if (json.isNotEmpty) {
    final weatherMap = json.first as Map<String, dynamic>;
    return weatherMap['main'] as String;
  }
  throw Exception('Invalid weather format');
}

int temperatureFromJson(Map<String, dynamic> json) => json['temp'].toInt();
