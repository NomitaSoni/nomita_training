import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';

class TimeValidationPage extends StatefulWidget {
  @override
  _TimeValidationPageState createState() => _TimeValidationPageState();
}

class _TimeValidationPageState extends State<TimeValidationPage> {
  late DateTime networkTime;
  late DateTime deviceTime;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await fetchNetworkTime();
    deviceTime = DateTime.now();
    setState(() {}); // Trigger a rebuild after initializing values
  }

  Future<void> fetchNetworkTime() async {
    try {
      networkTime = await NTP.now();
    } catch (error) {
      // Handle NTP fetch error
      print("NTP Fetch Error: $error");
      networkTime = DateTime.now(); // Initialize with device time on error
    }
  }

  bool isTimeValid() {
    if (networkTime == null) {
      return true; // Assume time is valid if network time fetch failed
    }

    Duration timeDifference = deviceTime.difference(networkTime);
    return timeDifference.abs() <= Duration(minutes: 10); // Adjust threshold as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Validation Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Device Time: $deviceTime'),
            Text('Network Time: ${networkTime}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (!isTimeValid()) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Time Validation'),
                      content: Text('Please adjust your device time.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Punch Attendance'),
            ),
          ],
        ),
      ),
    );
  }
}
