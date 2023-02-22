class Cities {
  String? city;
  String? lat;
  String? lng;
  String? country;
  String? iso2;
  String? adminName;
  String? capital;
  String? population;
  String? populationProper;

  Cities(
      {this.city,
      this.lat,
      this.lng,
      this.country,
      this.iso2,
      this.adminName,
      this.capital,
      this.population,
      this.populationProper});

  Cities.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    lat = json['lat'];
    lng = json['lng'];
    country = json['country'];
    iso2 = json['iso2'];
    adminName = json['admin_name'];
    capital = json['capital'];
    population = json['population'];
    populationProper = json['population_proper'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['lat'] = lat;
    data['lng'] = lng;
    data['country'] = country;
    data['iso2'] = iso2;
    data['admin_name'] = adminName;
    data['capital'] = capital;
    data['population'] = population;
    data['population_proper'] = populationProper;
    return data;
  }
}