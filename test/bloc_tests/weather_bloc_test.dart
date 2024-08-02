import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lesson90_practice/blocs/export_blocs.dart';
import 'package:lesson90_practice/data/models/weather.dart';
import 'package:lesson90_practice/data/repositories/weather_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('WeatherBloc', () {
    late MockWeatherRepository weatherRepository;
    late WeatherBloc weatherBloc;

    setUp(() {
      weatherRepository = MockWeatherRepository();
      weatherBloc = WeatherBloc(weatherRepository: weatherRepository);
    });

    test('Initial state Initial', () {
      expect(weatherBloc.state, const WeatherState.initial());
    });

    blocTest(
      'Get Weather Test Loaded',
      build: () => weatherBloc,
      act: (bloc) {
        when(() => weatherRepository.getWeather("Tashkent"))
            .thenAnswer((_) async {
          return const Weather(
            city: "Tashkent",
            temperature: 32,
            weather: "Clear",
          );
        });

        bloc.add(
          const WeatherEvent.getWeather("Tashkent"),
        );
      },
      expect: () => [
        const WeatherState.loading(),
        const WeatherState.loaded(
          Weather(city: "Tashkent", temperature: 32, weather: "Clear"),
        ),
      ],
    );

    blocTest(
      'Get Weather Test Error',
      build: () => weatherBloc,
      act: (bloc) {
        bloc.add(
          const WeatherEvent.getWeather("Tashkent"),
        );

        when(() => weatherRepository.getWeather("Tashkent"))
            .thenAnswer((_) async {
          throw ("Cannot find city");
        });
      },
      expect: () => [
        const WeatherState.loading(),
        const WeatherState.error("Cannot find city"),
      ],
    );
  });
}
