import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flutter_bloc/counter_bloc.dart';
import 'flutter_bloc/counter_screen.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        // CounterCubit(),
        child: CounterScreen(),
        // CounterPage(),
      ),
    );
  }
}