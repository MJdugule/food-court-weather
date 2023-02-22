import 'package:flutter/material.dart';
import 'package:food_weather/feature/cities/cities_viewmodel.dart';
import 'package:food_weather/feature/cities/widget/list_widget.dart';
import 'package:stacked/stacked.dart';

class CitiesView extends StatelessWidget {
  const CitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CitiesViewModel>.reactive(
      onViewModelReady: (model) {
        model.loadCity();
      },
        viewModelBuilder: () => CitiesViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text("Cities"),
            ),
            body: ListView.builder(
              itemCount: model.city.length,
              itemBuilder: (context, index) {
            return CitiesWidget(
              onTap: (){model.navigateToWeatherInfo(lat: model.city[index].lat, lon: model.city[index].lng, name: model.city[index].city!);},
              name: model.city[index].city!);
              },
            ),
          );
        });
  }
}
