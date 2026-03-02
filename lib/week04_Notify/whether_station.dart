class WeatherStation {
  int _temperature = 0;
  final List<WeatherListener> _listeners = [];

  int get temperature => _temperature;

  void changeTemperature(int newTemparature) {
    if (newTemparature != _temperature) {
      // 1- Change the value
      _temperature = newTemparature;

      // 2- Notify listener
      _notifyListeners();
    }
  }

  void addListener(WeatherListener listener) {
    _listeners.add(listener);
  }

  void _notifyListeners() {
    for (WeatherListener wl in _listeners) {
      wl.onTemperatureChange(_temperature);
    }
  }
}

abstract class WeatherListener {
  void onTemperatureChange(int temperature);
}

class MobileWeatherApp extends WeatherListener {
  @override
  void onTemperatureChange(int temperature) {
    print("scafold - Text - new temparaure is ${temperature.toString()}");
  }
}

class WebWeatherApp extends WeatherListener {
  @override
  void onTemperatureChange(int temperature) {
    print("<h1> ${temperature.toString()} </h1>");
  }
}

main() {
  WeatherStation station = WeatherStation();

  MobileWeatherApp mobileApp = MobileWeatherApp();
  WebWeatherApp webApp = WebWeatherApp();
  station.addListener(mobileApp);
  station.addListener(webApp);

  station.changeTemperature(15);
}
