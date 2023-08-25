import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';


void main() {
  runApp(MaterialApp(
    home: GeolocationExample(),
  ));
}

class GeolocationExample extends StatefulWidget {
  @override
  _GeolocationExampleState createState() => _GeolocationExampleState();
}

class _GeolocationExampleState extends State<GeolocationExample> {
  String latitude = '';
  String longitude = '';

 
  Future<void> getLocation() async {
    LocationPermission permission;

    try {
      permission = await GeolocatorPlatform.instance.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permission denied by user');
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        print('Location permission denied forever');
        return;
      }

      // Permission granted, get the current location
      Position position = await GeolocatorPlatform.instance.getCurrentPosition(
      //  desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude: $latitude'),
            Text('Longitude: $longitude'),
            ElevatedButton(
              onPressed: () {
                getLocation();
              },
              child: const Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}