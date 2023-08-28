import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'date_time_check/date_time.dart';
import 'date_time_check/network_time_protocol.dart';
import 'flutter_bloc/counter_bloc.dart';
import 'flutter_bloc/counter_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datetime Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TimeValidationPage(),
    );
  }
}
// void main() => runApp(CounterApp());

// class CounterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (_) => CounterBloc(),
//         // CounterCubit(),
//         child: CounterScreen(),
//         // CounterPage(),
//       ),
//     );
//   }
// }