
import 'package:food_weather/feature/cities/cities_view.dart';
import 'package:food_weather/feature/carousel/carousel_view.dart';
import 'package:food_weather/feature/current_weather/current_weather_view.dart';
import 'package:stacked/stacked.dart';

class DashBoardViewModel extends IndexTrackingViewModel {
 

  getView(int currentIndex) {
    switch (currentIndex) {
      case 0:
       return const CitiesView();
      case 1:
      return const CarouselView();
      case 2:
      return const CurrentWeatherView();
      default:
      return const CitiesView();
    }
  }
}