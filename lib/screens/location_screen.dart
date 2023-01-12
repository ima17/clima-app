import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/services.dart/weather.dart';
import 'package:clima_app/utilities/constants.dart';
import 'package:flutter/material.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, @required this.weatherData}) : super(key: key);
  final weatherData;

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int? tempreture;
  String? cityName;
  String? weatherIcon;
  String? weatherMessage;

  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cityName != ""
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/location_background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.8), BlendMode.dstATop),
                ),
              ),
              constraints: const BoxConstraints.expand(),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () async {
                            // var weatherData =
                            //     await weather.getLocationWeather();
                            // updateUIData(weatherData);
                          },
                          child: const Icon(
                            Icons.near_me,
                            size: 50.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            var typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CityScreen()),
                            );
                            if (typedName != null) {
                            }
                          },
                          child: const Icon(
                            Icons.location_city,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '$tempreture°',
                            style: kTempTextStyle,
                          ),
                          Text(
                            weatherIcon!,
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        "$weatherMessage in $cityName!",
                        textAlign: TextAlign.right,
                        style: kMessageTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.error),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    weatherMessage!,
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
            ),
    );
  }
}
