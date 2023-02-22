enum WeatherEnum{
  cloudy("Clouds"),
  clear("Clear"),
  rainy("Rain"),
  sunny("sunny");

  const WeatherEnum(this.weather);
  final String weather;
}

extension ChangeWeather on String{
  WeatherEnum toEnum(){
    switch (this) {
      case "Clouds":
        return WeatherEnum.cloudy;
      case "Rain":
        return WeatherEnum.rainy;
      case "sunny":
        return WeatherEnum.sunny;
      case "Clear":
        return WeatherEnum.sunny;
      default:
      return WeatherEnum.sunny;
    }
  }
}