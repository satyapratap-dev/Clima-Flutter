import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/location.dart';
import 'package:geolocator/geolocator.dart';

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
      Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$appId&units=metric');
      var locationData = await networkHelper.getData();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            print(locationData['coord']);
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
