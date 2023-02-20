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
              title: const Text("Cities"),
            ),
            body: ListView.builder(
              itemCount: model.city.length,
              itemBuilder: (context, index) {
            return CitiesWidget(name: model.city[index].city!);
              },
            ),
          );
        });
  }
}
