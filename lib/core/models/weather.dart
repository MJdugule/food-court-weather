

import 'package:hive/hive.dart';
part 'weather.g.dart';


@HiveType(typeId: 1)
class WeatherModel  {
  int? id;
  @HiveField(0)
  Main? main;
  @HiveField(1)
  String? description;
  String? icon;
  @HiveField(2)
  List<Weather>? weather;
  int? timezone;
  int? cod;
  @HiveField(3)
  String? name;
  @HiveField(4)
  Wind? wind;
  @HiveField(5)
  int? visibility;


  WeatherModel({this.wind, this.visibility, this.name, this.timezone, this.cod, this.weather, this.main, this.id, this.description, this.icon});

  

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
wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
    visibility: json['visibility'],
     // sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

}
@HiveType(typeId: 2)
class Wind {
  double? speed;
    @HiveField(0)
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

 
}
@HiveType(typeId: 2)
class Weather{
   @HiveField(0)
 int? id;
  @HiveField(1)
  String? main;
   @HiveField(2)
  String? description;
   @HiveField(3)
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

 

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }


}
@HiveType(typeId: 3)
class Main {
  @HiveField(0)
 double? temp;
@HiveField(1)
  int? humidity;
  double? tempKf;

  Main(
      {this.temp,
     
      this.humidity,
      this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }


}



class Sys {

      String? name;
  
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  Sys(
      {
      this.name,
      
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
 
    name = json['name'];
    
    country = json['country'];
    population = json['population'];
    
  }

}
