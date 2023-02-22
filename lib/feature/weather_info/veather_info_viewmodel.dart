
import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:food_weather/core/services/server_service.dart';
import 'package:stacked/stacked.dart';

class WeatherInfoViewModel extends BaseViewModel{
   final _server = locator<ServerService>();
   final log = getLogger("CarouselViewModel");
   WeatherModel? weatherInfo; 


   Future getCurrentWeather({required String lat, required String lon, required String name}) async {
    setBusy(true);
     final response = await _server.getCurrentWeather(lat: lat, lon: lon, name: name);
     if(response!=null){
      weatherInfo = response;
     }
setBusy(false);
  }
   
 
}