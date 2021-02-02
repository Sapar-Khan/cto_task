class City {
  int id;
  int countryId;
  String name;
  String nameEn;
  int ord;
  num long;
  num lati;
  int radius;

  City(
      {this.id,
      this.countryId,
      this.name,
      this.nameEn,
      this.ord,
      this.long,
      this.lati,
      this.radius});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    nameEn = json['name_en'];
    ord = json['ord'];
    long = json['location'][0];
    lati = json['location'][1];
    radius = json['radius'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id;
    json['country_id'] = countryId;
    json['name'] = name;
    json['name_en'] = nameEn;
    json['ord'] = ord;
    json['location'] = [long, lati];
    json['radius'] = radius;
  }
}
