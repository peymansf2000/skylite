class Oics {
  int? distance;
  double? latitude;
  double? longitude;
  int? useCount;
  String? id;
  String? name;
  int? quality;
  int? contribution;

  Oics({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  factory Oics.fromJson(Map<String, dynamic> json) => Oics(
        distance: json['distance'] as int?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        useCount: json['useCount'] as int?,
        id: json['id'] as String?,
        name: json['name'] as String?,
        quality: json['quality'] as int?,
        contribution: json['contribution'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'distance': distance,
        'latitude': latitude,
        'longitude': longitude,
        'useCount': useCount,
        'id': id,
        'name': name,
        'quality': quality,
        'contribution': contribution,
      };
}
