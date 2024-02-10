import 'package:skylite/features/weather/domain/entities/suggest_city_entity.dart';

import 'datum.dart';
import 'link.dart';
import 'metadata.dart';

class SuggestCityModel extends SuggestCityEntity {
  List<Link>? links;
  // List<Datum>? data;
  Metadata? metadata;

  SuggestCityModel({this.links, data, this.metadata}) : super(data: data);

  factory SuggestCityModel.fromJson(Map<String, dynamic> json) {
    return SuggestCityModel(
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'links': links?.map((e) => e.toJson()).toList(),
        'data': data?.map((e) => e.toJson()).toList(),
        'metadata': metadata?.toJson(),
      };
}
