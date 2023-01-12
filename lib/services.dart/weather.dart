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
