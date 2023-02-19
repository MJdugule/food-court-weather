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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['country'] = this.country;
    data['iso2'] = this.iso2;
    data['admin_name'] = this.adminName;
    data['capital'] = this.capital;
    data['population'] = this.population;
    data['population_proper'] = this.populationProper;
    return data;
  }
}