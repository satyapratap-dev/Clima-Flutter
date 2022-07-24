import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String appId = "6e93b3d15872f914c6929fed9ea71e9a";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void getCurrentLocationData() async {
    //Get the current location
    try {
      var locationData = await WeatherModel().getWeatherData();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(locationData: locationData);
          },
        ),
      );
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
