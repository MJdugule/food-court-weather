import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_weather/core/constants/app_asset.dart';
import 'package:food_weather/core/constants/app_colors.dart';
import 'package:food_weather/core/constants/app_spacing.dart';
import 'package:food_weather/feature/startup/carousel_viewmodel.dart';
import 'package:food_weather/feature/startup/widget/circle_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class CarouselView extends StatelessWidget {
  const CarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CarouselViewModel>.reactive(
      //onViewModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
                    children: [
                      Image.asset(
                        AppAsset.cloudy,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.verticalSpaceMassive,
                            Text(
                              "24\u2103",
                              style: GoogleFonts.lato(
                                  color: AppColors.kWhite,
                                  fontSize: 85,
                                  fontWeight: FontWeight.w300),
                            ),
                            AppSpacing.verticalSpaceLarge,
                            CarouselSlider.builder(
                               carouselController: CarouselController(),
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      model.setCurrentIndex(index);
                    },
                    enableInfiniteScroll: false,
                    viewportFraction: 0.8,
                    height: 400.h,
                                   
                    //height: double.infinity,
                    initialPage: model.currentIndex
                    // showIndicator: true,
                    // slideIndicator: CircularSlideIndicator(),
                    ),
                                      itemCount: 2,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                                return Card(
                                  // margin:
                                  //     const EdgeInsets.symmetric(horizontal: 40),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Ibadan",
                                          style: GoogleFonts.lato(
                                            fontSize: 45,
                                          ),
                                        ),
                                        AppSpacing.verticalSpaceMedium,
                                        Icon(
                                          Icons.sunny,
                                          size: 150,
                                        ),
                                        AppSpacing.verticalSpaceLarge,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                // Image.asset('assets/images/wind.png', color: Colors.purpleAccent.shade100, height: 30,),
                                                AppSpacing.verticalSpaceMedium,
                            
                                                Text(
                                                  "${50}km/h",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Wind",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                // Image.asset('assets/images/humidity.png', color: Colors.purpleAccent.shade100, height: 20,width: 50, ),
                                                AppSpacing.verticalSpaceMedium,
                            
                                                Text(
                                                  "${30}%",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Humidity",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ),
                                            AppSpacing.verticalSpaceMedium,
                                            Column(
                                              children: [
                                                //Image.asset('assets/images/visibility.png', color: Colors.purpleAccent.shade100, height: 30,),
                                                AppSpacing.verticalSpaceMedium,
                                                Text(
                                                  "${40}%",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Visibility",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            ),
                            AppSpacing.verticalSpaceMassive,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                model.currentIndex == 0
                                    ? const ActiveCircle()
                                    : const InActiveCircle(),
                                model.currentIndex == 1
                                    ? const ActiveCircle()
                                    : const InActiveCircle(),
                                model.currentIndex < 2
                                    ? const InActiveCircle()
                                    : const ActiveCircle(),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
               );
      },
      viewModelBuilder: () => CarouselViewModel(),
    );
  }
}
