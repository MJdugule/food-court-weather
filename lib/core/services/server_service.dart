
import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/core/constants/app_url.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:food_weather/core/services/api_service.dart';
import 'package:food_weather/core/services/network_service.dart';

class ServerService {
  
  final _apiService = locator<APIService>();
  final _networkFormatter = locator<NetworkService>();
  

 Future getCurrentWeather({required String lat, required String lon, required String name}) async {
     final response = await _networkFormatter.fmt((){
      return _apiService.get(route: AppUrl.url(lat, lon));

     });
     return response.fold(
      (l){
      
      return null ;
      }, (r) {
      
       var dataResponse = WeatherModel.fromJson(r);
      
      return dataResponse;
    });
     }
}