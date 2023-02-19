
import 'package:dartz/dartz.dart';
import 'package:food_weather/main.dart';

class WeatherModel  {
  const WeatherModel({
    required List<Weather> weather,
    required Main main,
    required Sys sys,
    required int timezone,
    required int id,
    required String name,
    required int cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weather:   (json['weather'] as List<dynamic>?)!.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      //  {
      //   weather = <Weather>[];
      //   json['weather'].forEach((v) {
      //     weather!.add(Weather.fromJson(v));
      //   });
      // },

      main: Main.fromJson(json['main']),

      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

}

class Weather{
  Weather({
    required int id,
    required String main,
    required String description,
    required String icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }


}

class Main {
  Main({
    required double temp,
    
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int humidity,
   
    
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json['temp'],
        
        tempMin: json['temp_min'],
        tempMax: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        
       );
  }


}

class Sys {
  Sys(
      {required int type,
      required int id,
      required String country,
      required int sunrise,
      required int sunset});
    

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

}
