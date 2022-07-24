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
    var url = Uri.parse('https://example.com/whatsit/create');
    var future = await get(url);
    print(future);
  }
}
