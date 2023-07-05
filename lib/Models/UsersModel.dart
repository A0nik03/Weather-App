// To parse this JSON data, do
//


import 'dart:convert';
// final userModel = userModelFromJson(jsonString);
List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Minutely> minutely;
  List<Current> hourly;
  List<Daily> daily;

  UserModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    timezone: json["timezone"],
    timezoneOffset: json["timezone_offset"],
    current: Current.fromJson(json["current"]),
    minutely: List<Minutely>.from(json["minutely"].map((x) => Minutely.fromJson(x))),
    hourly: List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
    daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "timezone": timezone,
    "timezone_offset": timezoneOffset,
    "current": current.toJson(),
    "minutely": List<dynamic>.from(minutely.map((x) => x.toJson())),
    "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
    "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
  };
}

class Current {
  int dt;
  int? sunrise;
  int? sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  double windGust;
  List<Weather> weather;
  double? pop;
  Rain? rain;

  Current({
    required this.dt,
    this.sunrise,
    this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    this.pop,
    this.rain,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    dt: json["dt"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    temp: json["temp"]?.toDouble(),
    feelsLike: json["feels_like"]?.toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"]?.toDouble(),
    uvi: json["uvi"]?.toDouble(),
    clouds: json["clouds"],
    visibility: json["visibility"],
    windSpeed: json["wind_speed"]?.toDouble(),
    windDeg: json["wind_deg"],
    windGust: json["wind_gust"]?.toDouble(),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    pop: json["pop"]?.toDouble(),
    rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "sunrise": sunrise,
    "sunset": sunset,
    "temp": temp,
    "feels_like": feelsLike,
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "uvi": uvi,
    "clouds": clouds,
    "visibility": visibility,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "wind_gust": windGust,
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "pop": pop,
    "rain": rain?.toJson(),
  };
}

class Rain {
  double the1H;

  Rain({
    required this.the1H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
    the1H: json["1h"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "1h": the1H,
  };
}

class Weather {
  int id;
  Main main;
  Description description;
  Icon icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: mainValues.map[json["main"]]!,
    description: descriptionValues.map[json["description"]]!,
    icon: iconValues.map[json["icon"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": mainValues.reverse[main],
    "description": descriptionValues.reverse[description],
    "icon": iconValues.reverse[icon],
  };
}

enum Description { BROKEN_CLOUDS, LIGHT_RAIN, MODERATE_RAIN, OVERCAST_CLOUDS, CLEAR_SKY, SCATTERED_CLOUDS, FEW_CLOUDS }

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Icon { THE_04_D, THE_10_D, THE_10_N, THE_04_N, THE_01_D, THE_03_D, THE_02_D }

final iconValues = EnumValues({
  "01d": Icon.THE_01_D,
  "02d": Icon.THE_02_D,
  "03d": Icon.THE_03_D,
  "04d": Icon.THE_04_D,
  "04n": Icon.THE_04_N,
  "10d": Icon.THE_10_D,
  "10n": Icon.THE_10_N
});

enum Main { CLOUDS, RAIN, CLEAR }

final mainValues = EnumValues({
  "Clear": Main.CLEAR,
  "Clouds": Main.CLOUDS,
  "Rain": Main.RAIN
});

class Daily {
  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  String summary;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  double windGust;
  List<Weather> weather;
  int clouds;
  double pop;
  double rain;
  double uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    dt: json["dt"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"]?.toDouble(),
    summary: json["summary"],
    temp: Temp.fromJson(json["temp"]),
    feelsLike: FeelsLike.fromJson(json["feels_like"]),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"]?.toDouble(),
    windSpeed: json["wind_speed"]?.toDouble(),
    windDeg: json["wind_deg"],
    windGust: json["wind_gust"]?.toDouble(),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: json["clouds"],
    pop: json["pop"]?.toDouble(),
    rain: json["rain"]?.toDouble(),
    uvi: json["uvi"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "summary": summary,
    "temp": temp.toJson(),
    "feels_like": feelsLike.toJson(),
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "wind_gust": windGust,
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "clouds": clouds,
    "pop": pop,
    "rain": rain,
    "uvi": uvi,
  };
}

class FeelsLike {
  double day;
  double night;
  double eve;
  double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
    day: json["day"]?.toDouble(),
    night: json["night"]?.toDouble(),
    eve: json["eve"]?.toDouble(),
    morn: json["morn"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Temp {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
    day: json["day"]?.toDouble(),
    min: json["min"]?.toDouble(),
    max: json["max"]?.toDouble(),
    night: json["night"]?.toDouble(),
    eve: json["eve"]?.toDouble(),
    morn: json["morn"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "min": min,
    "max": max,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Minutely {
  int dt;
  int precipitation;

  Minutely({
    required this.dt,
    required this.precipitation,
  });

  factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
    dt: json["dt"],
    precipitation: json["precipitation"],
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "precipitation": precipitation,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
