import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_weather/core/constants/app_asset.dart';
import 'package:food_weather/core/constants/app_colors.dart';
import 'package:food_weather/core/constants/app_spacing.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:food_weather/core/utils/enums.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({super.key, required this.name, required this.weather});
final String name;
final WeatherModel weather;
  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return     Center(
      child: Card(
       shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 7,
                                    // margin:
                                    //      EdgeInsets.symmetric(horizontal: 35.w),
                                    child: Container(
                                      width: 300.w,
                                          decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.bottomLeft,
                              colors: [AppColors.kGrey.shade700, AppColors.kGrey.shade400,]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                            vertical: 15.0.h, ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.name,
                                              style: GoogleFonts.lato(
                                                color: AppColors.kWhite,
                                                fontSize: 45.sp,
                                              ),
                                            ),
                                            AppSpacing.verticalSpaceMedium,
                                             Image.asset(
                           widget.weather.weather![0].main == WeatherEnum.cloudy.weather? AppAsset.cloud: widget.weather.weather!.first.main == WeatherEnum.sunny.weather 
                      ? AppAsset.sun :  widget.weather.weather![0].main == WeatherEnum.clear.weather ? AppAsset.sun
                      : AppAsset.rain,
                         // height: 100.h,
                          width: 120.w,
                        fit: BoxFit.fill,
                        ),
                                           
                                            AppSpacing.verticalSpaceLarge,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  children: [
                                                     Image.asset(AppAsset.wind,  height: 40,),
                                                    AppSpacing.verticalSpaceSmall,
                                                                
                                                    Text(
                                                      "${widget.weather.wind!.deg.toString()}km/h",
                                                      style: GoogleFonts.lato(
                                                        color: AppColors.kWhite,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Wind",
                                                      style: GoogleFonts.lato(
                                                        color: AppColors.kWhite,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                               AppSpacing.verticalSpaceRegular,
                                                Column(
                                                  children: [
                                                     Image.asset(AppAsset.humidity,  height: 30,width: 60, ),
                                                    AppSpacing.verticalSpaceSmall,
                                                                
                                                    Text(
                                                      "${widget.weather.main!.humidity.toString()}%",
                                                      style: GoogleFonts.lato(
                                                        color: AppColors.kWhite,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Humidity",
                                                      style: GoogleFonts.lato(
                                                        color: AppColors.kWhite,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                                AppSpacing.verticalSpaceMedium,
                                                Column(
                                                  children: [
                                                  Image.asset(AppAsset.visibility,  width: 40,),
                                                    AppSpacing.verticalSpaceSmall,
                                                    Text(
                                                      "${widget.weather.visibility.toString()}%",
                                                      style: GoogleFonts.lato(
                                                         color: AppColors.kWhite,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Visibility",
                                                      style: GoogleFonts.lato(
                                                         color: AppColors.kWhite,
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
                                    ),
                                  ),
    );
  }
}