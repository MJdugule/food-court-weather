import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/constants/app_asset.dart';
import 'package:food_weather/core/models/cities.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:food_weather/core/services/server_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CarouselViewModel extends BaseViewModel {
   final _server = locator<ServerService>();
   final _dialog = locator<DialogService>();
   final _navigator = locator<NavigationService>();
   
   final log = getLogger("CarouselViewModel");
   

  int _currentIndex = 0;
 
   final List<WeatherModel> _carouselWeather = [];
  List<WeatherModel> get carouselWeather => _carouselWeather;
  int get currentIndex => _currentIndex;
  WeatherModel? weatherInfo; 

    List<Cities> _city = [];
  List<Cities> get city => _city;

 Future loadCity() async{
  var response = await rootBundle.loadString(AppAsset.citiesList);
  List<Cities> cities = List<Cities>.from(json.decode(response).map((profile) => Cities.fromJson(profile)));
 
  _city = cities;
  notifyListeners();
  
  return cities;
 }

   Future init({lat, lon}) async {
    setBusy(true);
    await loadCity();
    if(carouselWeather.isEmpty){
    
      
     final response = await _server.getCurrentWeather(lat: "6.4500", lon: "3.4000", name: "Lagos");
     if(response!=null){
     

      carouselWeather.add(response);

      notifyListeners();
     
     
    //_carouselWeather = savedList;
      weatherInfo = response;
     }
setBusy(false);
  }

  }

 void addCity({lat, lon, name})async{
  setBusy(true);
   _navigator.back();
  final response = await _server.getCurrentWeather(lat: lat, lon: lon, name: name);
 
     if(response!=null){
      
      carouselWeather.add(response);
      //print(carouselWeather[2].name);
      notifyListeners();
    // _preferences.saveData("cachedWeathers", carouselWeather);
    //_carouselWeather = savedList;
      weatherInfo = response;
     }
setBusy(false);
 }

Future remove(int index)async{
 if(index == 0){

 }else{
  DialogResponse? response = await _dialog.showDialog(title: "Remove?", buttonTitle: "Yes", cancelTitle: "No",);
  if(response!.confirmed == true){
  
carouselWeather.removeAt(index);
_currentIndex = index-1;
  }
  }
  
  notifyListeners();
}

  void setCurrentIndex(int index) {
    _currentIndex = index;
    log.v(currentIndex);
    notifyListeners();
  }

  void navigateToSignUp() {
  //   _navigation.replaceWith(Routes.signupView);
  //  _preferences.saveData(kOnboardingDone, true);
  }
}