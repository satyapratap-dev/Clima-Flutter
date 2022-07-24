import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<Position> getCurrentLocation() async {
    //Get the current location
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      return position;
    } catch (e) {
      throw e;
    }
  }

  Future<void> getData() async {
    var url = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    var response = await get(url);
    print(response.body);
    if(response.)
  }
}
