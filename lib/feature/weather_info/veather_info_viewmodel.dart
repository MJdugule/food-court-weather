import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/constants/app_strings.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:food_weather/core/services/server_service.dart';
import 'package:food_weather/core/services/shared_preference_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WeatherInfoViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();
   final _server = locator<ServerService>();
   Weather? weather;

   final log = getLogger("CarouselViewModel");
Weather? weatherInfo; 
   Future getCurrentWeather({required String lat, required String lon}) async {
     final response = await _server.getCurrentWeather(lat: lat, lon: lon);
     if(response==true){
 final data = _preferences.getData(AppString.cachedWeather);
 weatherInfo = data;
     }

  }
   

}