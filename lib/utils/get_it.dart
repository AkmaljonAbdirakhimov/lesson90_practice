import 'package:get_it/get_it.dart';
import 'package:lesson90_practice/blocs/counter/counter_bloc.dart';
import 'package:lesson90_practice/blocs/weather/weather_bloc.dart';
import 'package:lesson90_practice/data/repositories/weather_repository.dart';

final getIt = GetIt.instance;

void dependencySetUp() {
  getIt.registerLazySingleton(() => WeatherRepository());

  getIt.registerLazySingleton(
    () => WeatherBloc(weatherRepository: getIt.get<WeatherRepository>()),
  );

  getIt.registerLazySingleton(() => CounterBloc());
}
