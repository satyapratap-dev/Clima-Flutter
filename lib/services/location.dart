import 'package:geolocator/geolocator.dart';
import 'networking.dart';

class Location {
  final String appId = "6e93b3d15872f914c6929fed9ea71e9a";

  Future getCurrentLocationData() async {
    //Get the current location
    try {
      Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$appId&units=metric');
      return networkHelper.getData();
    } catch (e) {
      throw e;
    }
  }
}
