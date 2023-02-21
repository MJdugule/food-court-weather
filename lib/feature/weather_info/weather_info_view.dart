import 'package:flutter/material.dart';
import 'package:food_weather/feature/weather_info/veather_info_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WeatherInfoView extends StatefulWidget {
  final String lat;
  final String lon;
  const WeatherInfoView({super.key, required this.lat, required this.lon});

  @override
  State<WeatherInfoView> createState() => _WeatherInfoViewState();
}

class _WeatherInfoViewState extends State<WeatherInfoView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WeatherInfoViewModel>.reactive(
        viewModelBuilder: () => WeatherInfoViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.getCurrentWeather(lat: widget.lat , lon: widget.lat);
        },
        builder: (context, model, child) {
          return Scaffold();
        });
  }
}
