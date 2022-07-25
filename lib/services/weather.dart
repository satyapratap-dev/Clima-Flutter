import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const String appId = "6e93b3d15872f914c6929fed9ea71e9a";
const String weatherURI = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getWeatherDatabyCityName(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('$weatherURI?lat=q=$cityName&appid=$appId&units=metric');
    var locationData = await networkHelper.getData();
    return locationData;
  }

  Future<dynamic> getWeatherData() async {
    Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    NetworkHelper networkHelper = NetworkHelper('$weatherURI?lat=${location.latitude}&lon=${location.longitude}&appid=$appId&units=metric');
    var locationData = await networkHelper.getData();
    return locationData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
