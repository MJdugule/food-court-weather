import 'package:flutter/material.dart';
import 'package:food_weather/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({super.key, required this.name, required this.onTap});
final String name;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(name, style: GoogleFonts.lato(fontSize: 20, color: AppColors.kWhite),),
    );
  }
}