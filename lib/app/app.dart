import 'package:stacked/stacked_annotations.dart';



@StackedApp(
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
   
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