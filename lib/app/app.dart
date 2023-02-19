import 'package:food_weather/core/services/api_service.dart';
import 'package:food_weather/core/services/network_service.dart';
import 'package:food_weather/core/services/server_service.dart';
import 'package:food_weather/core/services/shared_preference_service.dart';
import 'package:food_weather/feature/cities/cities_view.dart';
import 'package:food_weather/feature/dashboard/dashboard_view.dart';
import 'package:food_weather/feature/startup/carousel_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: DashBoardView, initial: true),
    AdaptiveRoute(page: CarouselView,),
    AdaptiveRoute(page: CitiesView,),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),

    // network
    LazySingleton(classType: ServerService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: APIService),

    // local storage
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    )
  ],
  logger: StackedLogger(),
)
class App {}
