import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/constants/app_strings.dart';
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
      
      return false ;
      }, (r) {
        Map<String, dynamic> response = jsonDecode(r);
      var dataResponse = Weather.fromJson(response);
      print(dataResponse.runtimeType);
      _preferences.saveData(AppString.cachedWeather, r.body);
      _log.v("Server created : ${dataResponse.runtimeType} ");
      return true;
    });
     }
}