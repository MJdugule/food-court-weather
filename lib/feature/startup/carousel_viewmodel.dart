import 'dart:convert';
import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/constants/app_strings.dart';
import 'package:food_weather/core/constants/app_url.dart';
import 'package:food_weather/core/exception/exceptions.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:food_weather/core/services/server_service.dart';
import 'package:food_weather/core/services/shared_preference_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CarouselViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();
   final _server = locator<ServerService>();

   final log = getLogger("CarouselViewModel");
   

  int _currentIndex = 0;
  final List<WeatherModel> _carouselWeather = [];
  List<WeatherModel> get carouselWeather => _carouselWeather;
  int get currentIndex => _currentIndex;


   Future createUser({lat, lon}) async {
    setBusy(true);
    final response = await _server.getCurrentWeather(
       lat: lat, lon: lon);
    if (response == true) {
      _preferences.saveData(AppString.cachedWeather, response);
      
    }
    setBusy(false);
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