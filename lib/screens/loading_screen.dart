import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    var locationData = Location().getCurrentLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: ElevatedButton(
        //   onPressed: () {
        //     //Get the current location
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return LocationScreen();
        //         },
        //       ),
        //     );
        //   },
        //   child: Text('Get Location'),
        // ),
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
