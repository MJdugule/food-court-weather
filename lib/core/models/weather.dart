

class WeatherModel  {
  int? id;
  Main? main;
  String? description;
  String? icon;
  List<Weather>? weather;
  int? timezone;
  int? cod;
  String? name;
  Wind? wind;
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

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

 
}

class Weather{
 int? id;
  String? main;
  String? description;
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

class Main {
 double? temp;

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
