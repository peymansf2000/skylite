class Link {
  String? rel;
  String? href;

  Link({this.rel, this.href});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json['rel'] as String?,
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rel': rel,
        'href': href,
      };
}
