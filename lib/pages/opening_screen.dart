import 'package:clima/pages/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/widget/reusable_expanded_widget.dart';
import 'package:clima/widget/reusable_textbutton_widget.dart';
import 'package:flutter/material.dart';

class OpeningScreen extends StatefulWidget {
  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  var decodeData;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Weather weather = Weather();
    await weather.getWeatherDataByLatAndLon();

    decodeData = await weather.weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ReusableExpanded(
              text: 'Find the Sun in Your City!',
              fontSize: 40,
            ),
            ReusableExpanded(
              text:
                  "It's a pleasure to keep track of the Weather with the New CLIMA App",
              fontSize: 28,
              color: Color(0xFF8D8E98),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 20),
              child: ReusableTextButton(
                buttonTitle: 'Get Started',
                onPressed: () {
                  setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationScreen(
                            weatherData: decodeData,
                          ),
                        ),
                      );
                    },
                  );
                },
                buttonColor: Color(0xFFEB1555),
              ),
            )
          ],
        ),
      ),
    );
  }
}
