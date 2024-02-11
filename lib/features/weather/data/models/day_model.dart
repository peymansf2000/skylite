class DayModel {
  final int timeStamp;
  final int tempMax;
  final int tempMin;
  final int temp;
  final int feelsLike;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final String description;
  final String icon;
  final int sunsetEpoch;
  final int sunriseEpoch;

  DayModel(
      {required this.windSpeed,
      required this.sunsetEpoch,
      required this.sunriseEpoch,
      required this.timeStamp,
      required this.tempMax,
      required this.tempMin,
      required this.temp,
      required this.feelsLike,
      required this.humidity,
      required this.pressure,
      required this.description,
      required this.icon});
}
