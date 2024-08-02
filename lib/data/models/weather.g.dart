// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      city: json['name'] as String,
      weather: weatherFromJson(json['weather'] as List),
      temperature: temperatureFromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'name': instance.city,
      'weather': instance.weather,
      'main': instance.temperature,
    };
