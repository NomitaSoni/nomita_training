import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _timezone = 'Unknown';
  List<String> _availableTimezones = <String>[];

  String nativeTimezone = '';
  String nativeTime = '';

 @override
  void initState() {
    super.initState();
    getNativeTime();
  }

  Future<void> getNativeTime() async {
    final String timezone = await FlutterNativeTimezone.getLocalTimezone();
    final DateTime now = DateTime.now().toLocal();

    setState(() {
      nativeTimezone = timezone;
      nativeTime = now.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Local timezone app'),
        ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Native Time Zone:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              nativeTimezone,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Native Time:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              nativeTime,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getNativeTime,
        child: const Icon(Icons.refresh),
      ),
      ),
    );
  }
}