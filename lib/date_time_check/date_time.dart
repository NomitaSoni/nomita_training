import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat('hh:mm a').format(currentTime);

    Duration timeZoneOffset = currentTime.timeZoneOffset;
    String formattedTimeZoneOffset = '${timeZoneOffset.inHours}:${timeZoneOffset.inMinutes.remainder(60)}';

    return Scaffold(
      appBar: AppBar(title: Text('Datetime Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Time: $formattedTime', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Timezone Offset: $formattedTimeZoneOffset', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
