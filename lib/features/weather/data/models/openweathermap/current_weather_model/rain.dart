class Rain {
  double? h1;

  Rain({this.h1});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        h1: (json['1h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '1h': h1,
      };
}
