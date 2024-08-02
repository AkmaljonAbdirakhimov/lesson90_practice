import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lesson90_practice/data/repositories/weather_repository.dart';

import '../../data/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.weatherRepository,
  }) : super(const _Initial()) {
    on<_GetWeather>(_getWeather);
  }

  final WeatherRepository weatherRepository;

  void _getWeather(_GetWeather event, emit) async {
    emit(const _Loading());
    try {
      final weather = await weatherRepository.getWeather(event.city);
      emit(_Loaded(weather));
    } catch (e) {
      emit(_Error(e.toString()));
    }
  }
}
