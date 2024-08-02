import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson90_practice/app/app.dart';
import 'package:lesson90_practice/blocs/providers.dart';
import 'package:lesson90_practice/utils/get_it.dart';

class Person {
  String name;

  Person(this.name);

  @override
  bool operator ==(Object other) {
    return identical(other, this) || (other as Person).name == name;
  }

  @override
  int get hashCode => Object.hash(this, name);
}

void main() async {
  dependencySetUp();
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: const App(),
    );
  }
}
