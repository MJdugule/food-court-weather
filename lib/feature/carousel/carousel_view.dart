import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_weather/app/widgets/info_card.dart';
import 'package:food_weather/core/constants/app_asset.dart';
import 'package:food_weather/core/constants/app_colors.dart';
import 'package:food_weather/core/constants/app_spacing.dart';
import 'package:food_weather/core/utils/enums.dart';
import 'package:food_weather/feature/carousel/carousel_viewmodel.dart';
import 'package:food_weather/feature/cities/widget/list_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class CarouselView extends StatelessWidget {
  const CarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CarouselViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) {
      
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: model.isBusy
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                    model.carouselWeather.isEmpty ? Container():  Image.asset(
                        model.carouselWeather[model.currentIndex].weather!.first.main ==
                                WeatherEnum.cloudy.weather
                            ? AppAsset.cloudy
                            : model.carouselWeather[model.currentIndex].weather!.first.main ==
                                    WeatherEnum.sunny.weather
                                ? AppAsset.clearSky
                                :model.carouselWeather[model.currentIndex].weather!.first.main ==
                                        WeatherEnum.clear.weather
                                    ? AppAsset.clearSky
                                    : AppAsset.rainny,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: AppColors.kGrey.withOpacity(0.3))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.verticalSpaceRegular,
                            AppSpacing.verticalSpaceRegular,
                            model.carouselWeather.isEmpty ? Container(): Text(
                              "${model.carouselWeather[model.currentIndex].main!.temp}\u2103",
                              style: GoogleFonts.lato(
                                  color: AppColors.kWhite,
                                  fontSize: 75,
                                  fontWeight: FontWeight.w300),
                            ),
                            model.carouselWeather.isEmpty ? Container(): const Divider(
                              color: AppColors.kWhite,
                              thickness: 1,
                            ),
                            model.carouselWeather.isEmpty ? Container(): Text(
                              model.carouselWeather[model.currentIndex].weather!.first.main ==
                                      WeatherEnum.cloudy.weather
                                  ? "Cloudy "
                                  : model.carouselWeather[model.currentIndex].weather!.first.main ==
                                          WeatherEnum.sunny.weather
                                      ? "Clear Sky"
                                      : model.carouselWeather[model.currentIndex].weather!.first.main ==
                                              WeatherEnum.clear.weather
                                          ? "ClearSky"
                                          : "Rainy",
                              style: GoogleFonts.lato(
                                  color: AppColors.kWhite,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w300),
                            ),
                            AppSpacing.verticalSpaceLarge,
                            model.carouselWeather.isEmpty
                                ? const Center(
                                    child: Text(
                                    "Click the + button to add weather",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.kWhite,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 35),
                                  ))
                                : CarouselSlider.builder(
                                    carouselController: CarouselController(),
                                    options: CarouselOptions(
                                      scrollPhysics: const BouncingScrollPhysics(),
                                        onPageChanged: (index, reason) {
                                         
                                          model.setCurrentIndex(index);
                                        },
                                        scrollDirection: Axis.horizontal,
                                        enableInfiniteScroll: false,
                                        viewportFraction: 0.85,
                                        height: 440.h,

                                        //height: double.infinity,
                                        initialPage: model.currentIndex
                                        // showIndicator: true,
                                        // slideIndicator: CircularSlideIndicator(),
                                        ),
                                    itemCount: model.carouselWeather.length,
                                    itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) {
                                      return
                                       GestureDetector(
                                          onLongPress: () {
                                            model.remove(itemIndex);
                                          },
                                          child: 
                                          InfoCard(
                                            name: model.carouselWeather[itemIndex].name
                                                .toString(),
                                            weather: model.carouselWeather[itemIndex],
                                          ));
                                    }),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     model.currentIndex == 0
                            //         ? const ActiveCircle()
                            //         : const InActiveCircle(),
                            //     model.currentIndex == 1
                            //         ? const ActiveCircle()
                            //         : const InActiveCircle(),
                            //     model.currentIndex < 2
                            //         ? const InActiveCircle()
                            //         : const ActiveCircle(),
                            //   ],
                            // ),
                            AppSpacing.verticalSpaceSmall,
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          color: AppColors.kGrey,
                                          child: ListView.builder(
                                            itemCount: model.city.length,
                                            itemBuilder: (context, index) {
                                              return CitiesWidget(
                                                  onTap: () {
                                                    model.addCity(
                                                        lat: model
                                                            .city[index].lat,
                                                        lon: model
                                                            .city[index].lng,
                                                        name: model
                                                            .city[index].city!);
                                                  },
                                                  name:
                                                      model.city[index].city!);
                                            },
                                          ),
                                        );
                                      });
                                },
                                icon: CircleAvatar(
                                    backgroundColor: AppColors.kGrey.shade400,
                                    child: const Icon(Icons.add)))
                          ],
                        ),
                      )
                    ],
                  ));
      },
      viewModelBuilder: () => CarouselViewModel(),
    );
  }
}
