class AppUrl{
  AppUrl._();

  static const String baseUrl = "https://api.openweathermap.org/";
  static String Function(dynamic lat, dynamic lon) get url =>
      (var lat, var lon) {
        String url;
        url = "data/2.5/weather?lat=$lat&lon=$lon&exclude=hourly,daily&appid=024212a03e10882be8403e707a96081a";
           
        return url;
      };
}