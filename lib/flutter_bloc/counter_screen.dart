import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart'; // Import your CounterBloc class

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text('Count: $count', style: TextStyle(fontSize: 24));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final counterBloc = BlocProvider.of<CounterBloc>(context);
                counterBloc.add(CounterIncrementPressed()); // Use the CounterIncrementPressed event
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
