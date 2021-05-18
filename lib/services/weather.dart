import 'location.dart';
import 'networking.dart';
import 'package:clima/const.dart';

class Weather {
  var weatherData;

  Future getWeatherDataByLatAndLon() async {
    Location location = Location();
    await location.getCurrentLocation();
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.lon}&appid=$kApiKey&units=metric');
    weatherData = await NetworkHelper(url: url).getCurrentWeatherData();
  }

  Future getWeatherDataByCityName(String cityName) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey&units=metric');
    return weatherData = await NetworkHelper(url: url).getCurrentWeatherData();
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
}
