import 'package:flutter/material.dart';
import 'package:food_weather/app/widgets/info_card.dart';
import 'package:food_weather/core/constants/app_asset.dart';
import 'package:food_weather/core/constants/app_colors.dart';
import 'package:food_weather/core/constants/app_spacing.dart';
import 'package:food_weather/core/utils/enums.dart';
import 'package:food_weather/feature/current_weather/current_weather_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class CurrentWeatherView extends StatefulWidget {
  const CurrentWeatherView({super.key});

  @override
  State<CurrentWeatherView> createState() => _CurrentWeatherViewState();
}

class _CurrentWeatherViewState extends State<CurrentWeatherView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrentWeatherViewModel>.reactive(
        viewModelBuilder: () => CurrentWeatherViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.getCurrentWeather();
        },
        builder: (context, model, child) {
          return Scaffold(
            body: model.isBusy ? const Center(child: CircularProgressIndicator()) : Stack(
                    children: [
                     
                      Image.asset(
                         model.weatherInfo!.weather![0].main == WeatherEnum.cloudy.weather? AppAsset.cloudy: model.weatherInfo!.weather!.first.main == WeatherEnum.sunny.weather 
                    ? AppAsset.clearSky :  model.weatherInfo!.weather![0].main == WeatherEnum.clear.weather ? AppAsset.clearSky
                    : AppAsset.rainny,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      
                      ),
                      Container(decoration: BoxDecoration(color: AppColors.kGrey.withOpacity(0.3))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.verticalSpaceMassive,
                            Text(
                              "${model.weatherInfo!.main!.temp}\u2103",
                              style: GoogleFonts.lato(
                                  color: AppColors.kWhite,
                                  fontSize: 75,
                                  fontWeight: FontWeight.w300),
                            ), 
                            const Divider(color: AppColors.kWhite, thickness: 1,),
                            Text(
                               model.weatherInfo!.weather![0].main == WeatherEnum.cloudy.weather? "Cloudy ": model.weatherInfo!.weather!.first.main == WeatherEnum.sunny.weather 
                    ? "Clear Sky" :  model.weatherInfo!.weather![0].main == WeatherEnum.clear.weather ? "ClearSky"
                    : "Rainy",
                              style: GoogleFonts.lato(
                                  color: AppColors.kWhite,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w300),
                            ),
                            AppSpacing.verticalSpaceLarge,
                            InfoCard(name: model.weatherInfo!.name.toString(), weather: model.weatherInfo!,),
                           
                          
                          
                          ],
                        ),
                      )
                    ],
                  ),
          );
        });
  }
}