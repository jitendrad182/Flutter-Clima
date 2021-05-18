import 'package:clima/pages/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var condition;
  var description;
  var temperature;
  var humidity;
  var windSpeed;
  var city;
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(var data) {
    setState(() {
      if (data == null) {
        condition = 0;
        description = "404 Server not found";
        temperature = "0";
        humidity = '0';
        windSpeed = '0';
        city = 'Error';
        return;
      } else {
        condition = data['weather'][0]['id'];
        description = data['weather'][0]['description'];
        temperature = data['main']['temp'];
        humidity = data['main']['humidity'];
        windSpeed = data['wind']['speed'];
        city = data['name'];
        return;
      }
    });
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
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              updateUI(widget.weatherData);
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '$city',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityScreen()));
                        setState(() async {
                          var data = await Weather()
                              .getWeatherDataByCityName(typedName);
                          if (typedName != null) {
                            updateUI(data);
                          } else {
                            updateUI(widget.weatherData);
                          }
                        });
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF1D1E33),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${Weather().getWeatherIcon(condition)}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 90),
                    ),
                    Text(
                      '$description',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      '$temperature°',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF1D1E33),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Cloud'),
                          Text(
                            '☁️',
                            style: TextStyle(fontSize: 35),
                          ),
                          Text(
                            '$description',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF1D1E33),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Wind'),
                          Text(
                            '💨',
                            style: TextStyle(fontSize: 35),
                          ),
                          Text(
                            '$windSpeed km/h',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF1D1E33),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Humidity'),
                          Text(
                            '💧',
                            style: TextStyle(fontSize: 35),
                          ),
                          Text(
                            '$humidity %',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
