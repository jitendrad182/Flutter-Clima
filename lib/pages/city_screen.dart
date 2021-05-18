import 'package:clima/widget/reusable_textbutton_widget.dart';
import 'package:clima/widget/reusable_textformfield_widget.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var cityName;
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Search A City',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Select a City or Country to see the weather conditions, relative humidity, wind speed.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    )
                  ],
                ),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableTextFormField(
                      hintText: 'Enter City Name',
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: Colors.grey,
                      ),
                      onChanged: (var value) {
                        setState(
                          () {
                            cityName = value;
                          },
                        );
                      },
                    ),
                    ReusableTextButton(
                        buttonTitle: 'Search',
                        onPressed: () {
                          setState(
                            () async {
                              Navigator.pop(context, await cityName);
                            },
                          );
                        },
                        buttonColor: Color(0xFFEB1555))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
