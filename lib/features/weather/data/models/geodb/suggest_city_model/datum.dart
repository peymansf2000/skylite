class Datum {
  int? id;
  String? wikiDataId;
  String? type;
  String? city;
  String? name;
  String? country;
  String? countryCode;
  String? region;
  String? regionCode;
  String? regionWdId;
  double? latitude;
  double? longitude;
  int? population;
  dynamic distance;
  String? placeType;

  Datum({
    this.id,
    this.wikiDataId,
    this.type,
    this.city,
    this.name,
    this.country,
    this.countryCode,
    this.region,
    this.regionCode,
    this.regionWdId,
    this.latitude,
    this.longitude,
    this.population,
    this.distance,
    this.placeType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        wikiDataId: json['wikiDataId'] as String?,
        type: json['type'] as String?,
        city: json['city'] as String?,
        name: json['name'] as String?,
        country: json['country'] as String?,
        countryCode: json['countryCode'] as String?,
        region: json['region'] as String?,
        regionCode: json['regionCode'] as String?,
        regionWdId: json['regionWdId'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        population: json['population'] as int?,
        distance: json['distance'] as dynamic,
        placeType: json['placeType'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'wikiDataId': wikiDataId,
        'type': type,
        'city': city,
        'name': name,
        'country': country,
        'countryCode': countryCode,
        'region': region,
        'regionCode': regionCode,
        'regionWdId': regionWdId,
        'latitude': latitude,
        'longitude': longitude,
        'population': population,
        'distance': distance,
        'placeType': placeType,
      };
}
