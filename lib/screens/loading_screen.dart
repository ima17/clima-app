import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services.dart/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var currentWeatherData = await WeatherModel().getLocationWeather();
    
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                weatherData: currentWeatherData,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
