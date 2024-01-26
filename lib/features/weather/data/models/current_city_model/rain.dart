class Rain {
  double? p1;

  Rain({this.p1});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        p1: (json['1h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '1h': p1,
      };
}
