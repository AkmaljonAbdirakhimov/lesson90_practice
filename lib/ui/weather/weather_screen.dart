import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/export_blocs.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter city',
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(WeatherEvent.getWeather(_cityController.text));
                },
                child: const Text('Get Weather'),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return const Center(
                      child: Text("Shahar nomini kiriting"),
                    );
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  loaded: (weather) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${weather.temperature}°C",
                          style: const TextStyle(
                              fontSize: 64, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          weather.city,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          weather.weather,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    );
                  },
                  error: (message) {
                    return Text(message);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
