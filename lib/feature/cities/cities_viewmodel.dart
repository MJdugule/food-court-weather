import 'dart:convert';
import 'dart:io';

import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/constants/app_asset.dart';
import 'package:food_weather/core/constants/app_strings.dart';
import 'package:food_weather/core/models/cities.dart';
import 'package:food_weather/core/services/server_service.dart';
import 'package:food_weather/core/services/shared_preference_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CitiesViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();
   final _server = locator<ServerService>();

   final log = getLogger("CarouselViewModel");
   

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  List<Cities> _city = [];
  List<Cities> get city => _city;

 Future<List<Cities>> loadCity() async{
  var input = await File(AppAsset.citiesList).readAsString();
  List<Cities> cities = jsonDecode(input);
  _city = cities;
  return cities;
 }

   Future getCurrentWeather({lat, lon}) async {
    setBusy(true);
    final response = await _server.getCurrentWeather(
       lat: lat, lon: lon);
    if (response == true) {
      _preferences.saveData(AppString.cachedWeather, response);
      
    }
    setBusy(false);
  }

  navigateToWeatherInfo(){
    _navigationService.navigateToView(view)
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