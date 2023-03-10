import 'package:clima_app/services.dart/location.dart';
import 'package:clima_app/services.dart/networking.dart';
import 'package:clima_app/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkCaller networkCaller =
        NetworkCaller(url: "$kurl?q=$cityName&appid=$kApiKey&units=metric");
    var currentWeatherData = await networkCaller.fetchWeatherData();
    return currentWeatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.fetchLocation();

    NetworkCaller networkCaller = NetworkCaller(
        url:
            "$kurl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric");

    var currentWeatherData = await networkCaller.fetchWeatherData();
    return currentWeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
