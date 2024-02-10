class Day {
  String? datetime;
  int? datetimeEpoch;
  double? tempmax;
  double? tempmin;
  double? temp;
  double? feelslikemax;
  double? feelslikemin;
  double? feelslike;
  double? dew;
  double? humidity;
  double? precip;
  double? precipprob;
  double? precipcover;
  dynamic preciptype;
  double? snow;
  double? snowdepth;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? cloudcover;
  double? visibility;
  double? solarradiation;
  double? solarenergy;
  double? uvindex;
  int? severerisk;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  String? conditions;
  String? description;
  String? icon;
  // List<String>? stations;
  String? source;

  Day({
    this.datetime,
    this.datetimeEpoch,
    this.tempmax,
    this.tempmin,
    this.temp,
    this.feelslikemax,
    this.feelslikemin,
    this.feelslike,
    this.dew,
    this.humidity,
    this.precip,
    this.precipprob,
    this.precipcover,
    this.preciptype,
    this.snow,
    this.snowdepth,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.cloudcover,
    this.visibility,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.severerisk,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.conditions,
    this.description,
    this.icon,
    // this.stations,
    this.source,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        datetime: json['datetime'] as String?,
        datetimeEpoch: json['datetimeEpoch'] as int?,
        tempmax: (json['tempmax'] as num?)?.toDouble(),
        tempmin: (json['tempmin'] as num?)?.toDouble(),
        temp: (json['temp'] as num?)?.toDouble(),
        feelslikemax: (json['feelslikemax'] as num?)?.toDouble(),
        feelslikemin: (json['feelslikemin'] as num?)?.toDouble(),
        feelslike: (json['feelslike'] as num?)?.toDouble(),
        dew: (json['dew'] as num?)?.toDouble(),
        humidity: (json['humidity'] as num?)?.toDouble(),
        precip: (json['precip'] as num?)?.toDouble(),
        precipprob: (json['precipprob'] as num?)?.toDouble(),
        precipcover: (json['precipcover'] as num?)?.toDouble(),
        preciptype: json['preciptype'] as dynamic,
        snow: (json['snow'] as num?)?.toDouble(),
        snowdepth: (json['snowdepth'] as num?)?.toDouble(),
        windgust: (json['windgust'] as num?)?.toDouble(),
        windspeed: (json['windspeed'] as num?)?.toDouble(),
        winddir: (json['winddir'] as num?)?.toDouble(),
        pressure: (json['pressure'] as num?)?.toDouble(),
        cloudcover: (json['cloudcover'] as num?)?.toDouble(),
        visibility: (json['visibility'] as num?)?.toDouble(),
        solarradiation: (json['solarradiation'] as num?)?.toDouble(),
        solarenergy: (json['solarenergy'] as num?)?.toDouble(),
        uvindex: (json['uvindex'] as num?)?.toDouble(),
        severerisk: (json['severerisk'] as num?)?.round(),
        sunrise: json['sunrise'] as String?,
        sunriseEpoch: (json['sunriseEpoch'] as num?)?.round(),
        sunset: json['sunset'] as String?,
        sunsetEpoch: (json['sunsetEpoch'] as num?)?.round(),
        moonphase: (json['moonphase'] as num?)?.toDouble(),
        conditions: json['conditions'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
        // stations: json['stations'] as List<String>?,
        source: json['source'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'datetime': datetime,
        'datetimeEpoch': datetimeEpoch,
        'tempmax': tempmax,
        'tempmin': tempmin,
        'temp': temp,
        'feelslikemax': feelslikemax,
        'feelslikemin': feelslikemin,
        'feelslike': feelslike,
        'dew': dew,
        'humidity': humidity,
        'precip': precip,
        'precipprob': precipprob,
        'precipcover': precipcover,
        'preciptype': preciptype,
        'snow': snow,
        'snowdepth': snowdepth,
        'windgust': windgust,
        'windspeed': windspeed,
        'winddir': winddir,
        'pressure': pressure,
        'cloudcover': cloudcover,
        'visibility': visibility,
        'solarradiation': solarradiation,
        'solarenergy': solarenergy,
        'uvindex': uvindex,
        'severerisk': severerisk,
        'sunrise': sunrise,
        'sunriseEpoch': sunriseEpoch,
        'sunset': sunset,
        'sunsetEpoch': sunsetEpoch,
        'moonphase': moonphase,
        'conditions': conditions,
        'description': description,
        'icon': icon,
        // 'stations': stations,
        'source': source,
      };
}
