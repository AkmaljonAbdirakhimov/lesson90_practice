import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson90_practice/app/app.dart';
import 'package:lesson90_practice/blocs/weather/weather_bloc.dart';
import 'package:lesson90_practice/utils/get_it.dart';

void main() {
  dependencySetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt.get<WeatherBloc>(),
        )
      ],
      child: const App(),
    );
  }
}
