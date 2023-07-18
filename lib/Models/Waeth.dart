
class Waeth {
  Waeth({
      num? lat, 
      num? lon, 
      String? timezone, 
      num? timezoneOffset, 
      Current? current, 
      List<Hourly>? hourly, 
      List<Daily>? daily, 
      List<Alerts>? alerts,}){
    _lat = lat;
    _lon = lon;
    _timezone = timezone;
    _timezoneOffset = timezoneOffset;
    _current = current;
    _hourly = hourly;
    _daily = daily;
    _alerts = alerts;
}

  Waeth.fromJson(dynamic json) {
    _lat = json['lat'];
    _lon = json['lon'];
    _timezone = json['timezone'];
    _timezoneOffset = json['timezone_offset'];
    _current = json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['hourly'] != null) {
      _hourly = [];
      json['hourly'].forEach((v) {
        _hourly?.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      _daily = [];
      json['daily'].forEach((v) {
        _daily?.add(Daily.fromJson(v));
      });
    }
    if (json['alerts'] != null) {
      _alerts = [];
      json['alerts'].forEach((v) {
        _alerts?.add(Alerts.fromJson(v));
      });
    }
  }
  num? _lat;
  num? _lon;
  String? _timezone;
  num? _timezoneOffset;
  Current? _current;
  List<Hourly>? _hourly;
  List<Daily>? _daily;
  List<Alerts>? _alerts;
Waeth copyWith({  num? lat,
  num? lon,
  String? timezone,
  num? timezoneOffset,
  Current? current,
  List<Hourly>? hourly,
  List<Daily>? daily,
  List<Alerts>? alerts,
}) => Waeth(  lat: lat ?? _lat,
  lon: lon ?? _lon,
  timezone: timezone ?? _timezone,
  timezoneOffset: timezoneOffset ?? _timezoneOffset,
  current: current ?? _current,
  hourly: hourly ?? _hourly,
  daily: daily ?? _daily,
  alerts: alerts ?? _alerts,
);
  num? get lat => _lat;
  num? get lon => _lon;
  String? get timezone => _timezone;
  num? get timezoneOffset => _timezoneOffset;
  Current? get current => _current;
  List<Hourly>? get hourly => _hourly;
  List<Daily>? get daily => _daily;
  List<Alerts>? get alerts => _alerts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['timezone'] = _timezone;
    map['timezone_offset'] = _timezoneOffset;
    if (_current != null) {
      map['current'] = _current?.toJson();
    }
    if (_hourly != null) {
      map['hourly'] = _hourly?.map((v) => v.toJson()).toList();
    }
    if (_daily != null) {
      map['daily'] = _daily?.map((v) => v.toJson()).toList();
    }
    if (_alerts != null) {
      map['alerts'] = _alerts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Alerts {
  Alerts({
      String? senderName, 
      String? event, 
      num? start, 
      num? end, 
      String? description, 
      List<String>? tags,}){
    _senderName = senderName;
    _event = event;
    _start = start;
    _end = end;
    _description = description;
    _tags = tags;
}

  Alerts.fromJson(dynamic json) {
    _senderName = json['sender_name'];
    _event = json['event'];
    _start = json['start'];
    _end = json['end'];
    _description = json['description'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }
  String? _senderName;
  String? _event;
  num? _start;
  num? _end;
  String? _description;
  List<String>? _tags;
Alerts copyWith({  String? senderName,
  String? event,
  num? start,
  num? end,
  String? description,
  List<String>? tags,
}) => Alerts(  senderName: senderName ?? _senderName,
  event: event ?? _event,
  start: start ?? _start,
  end: end ?? _end,
  description: description ?? _description,
  tags: tags ?? _tags,
);
  String? get senderName => _senderName;
  String? get event => _event;
  num? get start => _start;
  num? get end => _end;
  String? get description => _description;
  List<String>? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sender_name'] = _senderName;
    map['event'] = _event;
    map['start'] = _start;
    map['end'] = _end;
    map['description'] = _description;
    map['tags'] = _tags;
    return map;
  }

}


class Daily {
  Daily({
      num? dt, 
      num? sunrise, 
      num? sunset, 
      num? moonrise, 
      num? moonset, 
      num? moonPhase, 
      String? summary, 
      Temp? temp, 
      FeelsLike? feelsLike, 
      num? pressure, 
      num? humidity, 
      num? dewPoint, 
      num? windSpeed, 
      num? windDeg, 
      num? windGust, 
      List<Weather>? weather, 
      num? clouds, 
      num? pop, 
      num? uvi,}){
    _dt = dt;
    _sunrise = sunrise;
    _sunset = sunset;
    _moonrise = moonrise;
    _moonset = moonset;
    _moonPhase = moonPhase;
    _summary = summary;
    _temp = temp;
    _feelsLike = feelsLike;
    _pressure = pressure;
    _humidity = humidity;
    _dewPoint = dewPoint;
    _windSpeed = windSpeed;
    _windDeg = windDeg;
    _windGust = windGust;
    _weather = weather;
    _clouds = clouds;
    _pop = pop;
    _uvi = uvi;
}

  Daily.fromJson(dynamic json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'];
    _summary = json['summary'];
    _temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    _feelsLike = json['feels_like'] != null ? FeelsLike.fromJson(json['feels_like']) : null;
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    _windGust = json['wind_gust'];
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'];
    _pop = json['pop'];
    _uvi = json['uvi'];
  }
  num? _dt;
  num? _sunrise;
  num? _sunset;
  num? _moonrise;
  num? _moonset;
  num? _moonPhase;
  String? _summary;
  Temp? _temp;
  FeelsLike? _feelsLike;
  num? _pressure;
  num? _humidity;
  num? _dewPoint;
  num? _windSpeed;
  num? _windDeg;
  num? _windGust;
  List<Weather>? _weather;
  num? _clouds;
  num? _pop;
  num? _uvi;
Daily copyWith({  num? dt,
  num? sunrise,
  num? sunset,
  num? moonrise,
  num? moonset,
  num? moonPhase,
  String? summary,
  Temp? temp,
  FeelsLike? feelsLike,
  num? pressure,
  num? humidity,
  num? dewPoint,
  num? windSpeed,
  num? windDeg,
  num? windGust,
  List<Weather>? weather,
  num? clouds,
  num? pop,
  num? uvi,
}) => Daily(  dt: dt ?? _dt,
  sunrise: sunrise ?? _sunrise,
  sunset: sunset ?? _sunset,
  moonrise: moonrise ?? _moonrise,
  moonset: moonset ?? _moonset,
  moonPhase: moonPhase ?? _moonPhase,
  summary: summary ?? _summary,
  temp: temp ?? _temp,
  feelsLike: feelsLike ?? _feelsLike,
  pressure: pressure ?? _pressure,
  humidity: humidity ?? _humidity,
  dewPoint: dewPoint ?? _dewPoint,
  windSpeed: windSpeed ?? _windSpeed,
  windDeg: windDeg ?? _windDeg,
  windGust: windGust ?? _windGust,
  weather: weather ?? _weather,
  clouds: clouds ?? _clouds,
  pop: pop ?? _pop,
  uvi: uvi ?? _uvi,
);
  num? get dt => _dt;
  num? get sunrise => _sunrise;
  num? get sunset => _sunset;
  num? get moonrise => _moonrise;
  num? get moonset => _moonset;
  num? get moonPhase => _moonPhase;
  String? get summary => _summary;
  Temp? get temp => _temp;
  FeelsLike? get feelsLike => _feelsLike;
  num? get pressure => _pressure;
  num? get humidity => _humidity;
  num? get dewPoint => _dewPoint;
  num? get windSpeed => _windSpeed;
  num? get windDeg => _windDeg;
  num? get windGust => _windGust;
  List<Weather>? get weather => _weather;
  num? get clouds => _clouds;
  num? get pop => _pop;
  num? get uvi => _uvi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['moonrise'] = _moonrise;
    map['moonset'] = _moonset;
    map['moon_phase'] = _moonPhase;
    map['summary'] = _summary;
    if (_temp != null) {
      map['temp'] = _temp?.toJson();
    }
    if (_feelsLike != null) {
      map['feels_like'] = _feelsLike?.toJson();
    }
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['dew_point'] = _dewPoint;
    map['wind_speed'] = _windSpeed;
    map['wind_deg'] = _windDeg;
    map['wind_gust'] = _windGust;
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['clouds'] = _clouds;
    map['pop'] = _pop;
    map['uvi'] = _uvi;
    return map;
  }

}

/// id : 803
/// main : "Clouds"
/// description : "broken clouds"
/// icon : "04d"

class Weather {
  Weather({
      num? id, 
      String? main, 
      String? description, 
      String? icon,}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  num? _id;
  String? _main;
  String? _description;
  String? _icon;
Weather copyWith({  num? id,
  String? main,
  String? description,
  String? icon,
}) => Weather(  id: id ?? _id,
  main: main ?? _main,
  description: description ?? _description,
  icon: icon ?? _icon,
);
  num? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}

/// day : 38.29
/// night : 31.49
/// eve : 40.5
/// morn : 26.09

class FeelsLike {
  FeelsLike({
      num? day, 
      num? night, 
      num? eve, 
      num? morn,}){
    _day = day;
    _night = night;
    _eve = eve;
    _morn = morn;
}

  FeelsLike.fromJson(dynamic json) {
    _day = json['day'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }
  num? _day;
  num? _night;
  num? _eve;
  num? _morn;
FeelsLike copyWith({  num? day,
  num? night,
  num? eve,
  num? morn,
}) => FeelsLike(  day: day ?? _day,
  night: night ?? _night,
  eve: eve ?? _eve,
  morn: morn ?? _morn,
);
  num? get day => _day;
  num? get night => _night;
  num? get eve => _eve;
  num? get morn => _morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['night'] = _night;
    map['eve'] = _eve;
    map['morn'] = _morn;
    return map;
  }

}

/// day : 34.9
/// min : 25.84
/// max : 36.41
/// night : 28.34
/// eve : 34.44
/// morn : 26.09

class Temp {
  Temp({
      num? day, 
      num? min, 
      num? max, 
      num? night, 
      num? eve, 
      num? morn,}){
    _day = day;
    _min = min;
    _max = max;
    _night = night;
    _eve = eve;
    _morn = morn;
}

  Temp.fromJson(dynamic json) {
    _day = json['day'];
    _min = json['min'];
    _max = json['max'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }
  num? _day;
  num? _min;
  num? _max;
  num? _night;
  num? _eve;
  num? _morn;
Temp copyWith({  num? day,
  num? min,
  num? max,
  num? night,
  num? eve,
  num? morn,
}) => Temp(  day: day ?? _day,
  min: min ?? _min,
  max: max ?? _max,
  night: night ?? _night,
  eve: eve ?? _eve,
  morn: morn ?? _morn,
);
  num? get day => _day;
  num? get min => _min;
  num? get max => _max;
  num? get night => _night;
  num? get eve => _eve;
  num? get morn => _morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['min'] = _min;
    map['max'] = _max;
    map['night'] = _night;
    map['eve'] = _eve;
    map['morn'] = _morn;
    return map;
  }

}

/// dt : 1689418800
/// temp : 26.35
/// feels_like : 26.35
/// pressure : 1012
/// humidity : 89
/// dew_point : 24.39
/// uvi : 0
/// clouds : 0
/// visibility : 10000
/// wind_speed : 1.75
/// wind_deg : 255
/// wind_gust : 2.21
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]
/// pop : 0

class Hourly {
  Hourly({
      num? dt, 
      num? temp, 
      num? feelsLike, 
      num? pressure, 
      num? humidity, 
      num? dewPoint, 
      num? uvi, 
      num? clouds, 
      num? visibility, 
      num? windSpeed, 
      num? windDeg, 
      num? windGust, 
      List<Weather>? weather, 
      num? pop,}){
    _dt = dt;
    _temp = temp;
    _feelsLike = feelsLike;
    _pressure = pressure;
    _humidity = humidity;
    _dewPoint = dewPoint;
    _uvi = uvi;
    _clouds = clouds;
    _visibility = visibility;
    _windSpeed = windSpeed;
    _windDeg = windDeg;
    _windGust = windGust;
    _weather = weather;
    _pop = pop;
}

  Hourly.fromJson(dynamic json) {
    _dt = json['dt'];
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'];
    _uvi = json['uvi'];
    _clouds = json['clouds'];
    _visibility = json['visibility'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    _windGust = json['wind_gust'];
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _pop = json['pop'];
  }
  num? _dt;
  num? _temp;
  num? _feelsLike;
  num? _pressure;
  num? _humidity;
  num? _dewPoint;
  num? _uvi;
  num? _clouds;
  num? _visibility;
  num? _windSpeed;
  num? _windDeg;
  num? _windGust;
  List<Weather>? _weather;
  num? _pop;
Hourly copyWith({  num? dt,
  num? temp,
  num? feelsLike,
  num? pressure,
  num? humidity,
  num? dewPoint,
  num? uvi,
  num? clouds,
  num? visibility,
  num? windSpeed,
  num? windDeg,
  num? windGust,
  List<Weather>? weather,
  num? pop,
}) => Hourly(  dt: dt ?? _dt,
  temp: temp ?? _temp,
  feelsLike: feelsLike ?? _feelsLike,
  pressure: pressure ?? _pressure,
  humidity: humidity ?? _humidity,
  dewPoint: dewPoint ?? _dewPoint,
  uvi: uvi ?? _uvi,
  clouds: clouds ?? _clouds,
  visibility: visibility ?? _visibility,
  windSpeed: windSpeed ?? _windSpeed,
  windDeg: windDeg ?? _windDeg,
  windGust: windGust ?? _windGust,
  weather: weather ?? _weather,
  pop: pop ?? _pop,
);
  num? get dt => _dt;
  num? get temp => _temp;
  num? get feelsLike => _feelsLike;
  num? get pressure => _pressure;
  num? get humidity => _humidity;
  num? get dewPoint => _dewPoint;
  num? get uvi => _uvi;
  num? get clouds => _clouds;
  num? get visibility => _visibility;
  num? get windSpeed => _windSpeed;
  num? get windDeg => _windDeg;
  num? get windGust => _windGust;
  List<Weather>? get weather => _weather;
  num? get pop => _pop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['dew_point'] = _dewPoint;
    map['uvi'] = _uvi;
    map['clouds'] = _clouds;
    map['visibility'] = _visibility;
    map['wind_speed'] = _windSpeed;
    map['wind_deg'] = _windDeg;
    map['wind_gust'] = _windGust;
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['pop'] = _pop;
    return map;
  }

}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01n"



/// dt : 1689418905
/// sunrise : 1689419823
/// sunset : 1689470805
/// temp : 26.35
/// feels_like : 26.35
/// pressure : 1012
/// humidity : 89
/// dew_point : 24.39
/// uvi : 0
/// clouds : 0
/// visibility : 10000
/// wind_speed : 2.24
/// wind_deg : 100
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]

class Current {
  Current({
      num? dt, 
      num? sunrise, 
      num? sunset, 
      num? temp, 
      num? feelsLike, 
      num? pressure, 
      num? humidity, 
      num? dewPoint, 
      num? uvi, 
      num? clouds, 
      num? visibility, 
      num? windSpeed, 
      num? windDeg, 
      List<Weather>? weather,}){
    _dt = dt;
    _sunrise = sunrise;
    _sunset = sunset;
    _temp = temp;
    _feelsLike = feelsLike;
    _pressure = pressure;
    _humidity = humidity;
    _dewPoint = dewPoint;
    _uvi = uvi;
    _clouds = clouds;
    _visibility = visibility;
    _windSpeed = windSpeed;
    _windDeg = windDeg;
    _weather = weather;
}

  Current.fromJson(dynamic json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'];
    _uvi = json['uvi'];
    _clouds = json['clouds'];
    _visibility = json['visibility'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
  }
  num? _dt;
  num? _sunrise;
  num? _sunset;
  num? _temp;
  num? _feelsLike;
  num? _pressure;
  num? _humidity;
  num? _dewPoint;
  num? _uvi;
  num? _clouds;
  num? _visibility;
  num? _windSpeed;
  num? _windDeg;
  List<Weather>? _weather;
Current copyWith({  num? dt,
  num? sunrise,
  num? sunset,
  num? temp,
  num? feelsLike,
  num? pressure,
  num? humidity,
  num? dewPoint,
  num? uvi,
  num? clouds,
  num? visibility,
  num? windSpeed,
  num? windDeg,
  List<Weather>? weather,
}) => Current(  dt: dt ?? _dt,
  sunrise: sunrise ?? _sunrise,
  sunset: sunset ?? _sunset,
  temp: temp ?? _temp,
  feelsLike: feelsLike ?? _feelsLike,
  pressure: pressure ?? _pressure,
  humidity: humidity ?? _humidity,
  dewPoint: dewPoint ?? _dewPoint,
  uvi: uvi ?? _uvi,
  clouds: clouds ?? _clouds,
  visibility: visibility ?? _visibility,
  windSpeed: windSpeed ?? _windSpeed,
  windDeg: windDeg ?? _windDeg,
  weather: weather ?? _weather,
);
  num? get dt => _dt;
  num? get sunrise => _sunrise;
  num? get sunset => _sunset;
  num? get temp => _temp;
  num? get feelsLike => _feelsLike;
  num? get pressure => _pressure;
  num? get humidity => _humidity;
  num? get dewPoint => _dewPoint;
  num? get uvi => _uvi;
  num? get clouds => _clouds;
  num? get visibility => _visibility;
  num? get windSpeed => _windSpeed;
  num? get windDeg => _windDeg;
  List<Weather>? get weather => _weather;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['dew_point'] = _dewPoint;
    map['uvi'] = _uvi;
    map['clouds'] = _clouds;
    map['visibility'] = _visibility;
    map['wind_speed'] = _windSpeed;
    map['wind_deg'] = _windDeg;
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
