import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/constants/app_url.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:food_weather/core/services/api_service.dart';
import 'package:food_weather/core/services/network_service.dart';
import 'package:food_weather/core/services/shared_preference_service.dart';

class ServerService {
  final _log = getLogger("ServerService");
  final _apiService = locator<APIService>();
  final _networkFormatter = locator<NetworkService>();
  final _preferences = locator<SharedPreferencesService>();

 Future<bool> getCurrentWeather({required String lat, required String lon}) async {
     final response = await _networkFormatter.fmt((){
      return _apiService.get(route: AppUrl.url(lat, lon));

     });
     return response.fold(
      (l){
      
      return false;}, (r) {
      
      final dataResponse = WeatherModel.fromJson(r);
      _log.v("Server created : $dataResponse");
      return true;
    });
     }
}