import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = new Location();
  StreamSubscription? streamData;
  double? lan;
  double? lat;

  @override
  void initState() {
    super.initState();
    getLocation();

    streamData =
        location.onLocationChanged.listen((LocationData currentLocation) {
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      setState(() {
        lan = currentLocation.latitude;
        lat = currentLocation.longitude;
      });
    });
  }

  @override
  void dispose() {
    streamData?.cancel();
    super.dispose();
  }

  getLocation() async {
    await location.requestPermission();
    await location.hasPermission();
    var currentLocation = await location.getLocation();
    setState(() {
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      lan = currentLocation.latitude;
      lat = currentLocation.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: lat == null
          ? CircularProgressIndicator()
          : Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          text: 'Latitude',
                          children: [
                            TextSpan(
                                text: '\n$lat',
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red))
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          text: 'Latitude',
                          children: [
                            TextSpan(
                                text: '\n$lan',
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red))
                          ]),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
