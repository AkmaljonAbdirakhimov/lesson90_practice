import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/get_it.dart';
import 'export_blocs.dart';

get providers => [
      BlocProvider.value(
        value: getIt.get<WeatherBloc>(),
      ),
      BlocProvider.value(
        value: getIt.get<CounterBloc>(),
      )
    ];
