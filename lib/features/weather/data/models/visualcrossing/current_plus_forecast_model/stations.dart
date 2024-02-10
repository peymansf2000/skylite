import 'oics.dart';

class Stations {
  Oics? oics;

  Stations({this.oics});

  factory Stations.fromJson(Map<String, dynamic> json) => Stations(
        oics: json['OICS'] == null
            ? null
            : Oics.fromJson(json['OICS'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'OICS': oics?.toJson(),
      };
}
