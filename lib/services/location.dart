import 'package:geolocator/geolocator.dart';
import 'networking.dart';

class Location {
  late double latitude;
  late double longitude;
  final String appId = "6e93b3d15872f914c6929fed9ea71e9a";

  Future getCurrentLocationData() async {
    //Get the current location
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
      NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appId');
      return networkHelper.getData();
    } catch (e) {
      throw e;
    }
  }
}
