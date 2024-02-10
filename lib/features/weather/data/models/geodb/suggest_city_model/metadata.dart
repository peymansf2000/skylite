class Metadata {
  int? currentOffset;
  int? totalCount;

  Metadata({this.currentOffset, this.totalCount});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentOffset: json['currentOffset'] as int?,
        totalCount: json['totalCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'currentOffset': currentOffset,
        'totalCount': totalCount,
      };
}
