  import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:food_weather/core/services/server_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';

class CurrentWeatherViewModel extends BaseViewModel{
   final _server = locator<ServerService>();
   final log = getLogger("CurrenytWeatherViewModel");
     WeatherModel? weatherInfo;

  Future<bool> requestPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
          
        return true;
      }
     
      return Future.error('Location permissions are denied');
    } else {
      
      return true;
    }
  }

  Future<Position> getCurrentLocation() async {
    await requestPermission();
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

   Future getCurrentWeather() async {
    setBusy(true);
    var latlon = await getCurrentLocation();
     final response = await _server.getCurrentWeather(lat: latlon.latitude.toString(), lon: latlon.longitude.toString(), name: '', );
     if(response!=null){
      weatherInfo = response;
     }
setBusy(false);
  }
}
  
  