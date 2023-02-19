
import 'package:food_weather/feature/cities/cities_view.dart';
import 'package:food_weather/feature/startup/carousel_view.dart';
import 'package:stacked/stacked.dart';

class DashBoardViewModel extends IndexTrackingViewModel {
 

  getView(int currentIndex) {
    switch (currentIndex) {
      case 0:
       return const CitiesView();
      case 1:
      return const CarouselView();
      case 2:
      return const CarouselView();
      default:
      return const CitiesView();
    }
  }
  
  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}