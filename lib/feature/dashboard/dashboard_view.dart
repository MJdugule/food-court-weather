import 'package:flutter/material.dart';
import 'package:food_weather/core/constants/app_colors.dart';
import 'package:food_weather/feature/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashBoardViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: model.getView(model.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 0,
            iconSize: 30,
            selectedIconTheme:  IconThemeData(color: Colors.yellow.shade800) ,
            unselectedIconTheme: const IconThemeData(color: AppColors.kWhite) ,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.kGrey,
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            items: const [

               BottomNavigationBarItem(
                  icon: Icon(Icons.map), label: ""),
               BottomNavigationBarItem(
                  icon: Icon(Icons.list_outlined), label: ""),
               BottomNavigationBarItem(
                  icon: Icon(Icons.location_city_sharp), label: ""),
          
            ],
          ),
        );
      },
      viewModelBuilder: () => DashBoardViewModel(),
    );
  }
}