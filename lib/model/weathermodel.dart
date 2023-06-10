import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Location? location;
  CurrentObservation? currentObservation;
  List<Forecast>? forecasts;

  Model({
    this.location,
    this.currentObservation,
    this.forecasts,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        currentObservation: json["current_observation"] == null
            ? null
            : CurrentObservation.fromJson(json["current_observation"]),
        forecasts: json["forecasts"] == null
            ? []
            : List<Forecast>.from(
                json["forecasts"]!.map((x) => Forecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current_observation": currentObservation?.toJson(),
        "forecasts": forecasts == null
            ? []
            : List<dynamic>.from(forecasts!.map((x) => x.toJson())),
      };
}

class CurrentObservation {
  int? pubDate;
  Wind? wind;
  Atmosphere? atmosphere;
  Astronomy? astronomy;
  Condition? condition;

  CurrentObservation({
    this.pubDate,
    this.wind,
    this.atmosphere,
    this.astronomy,
    this.condition,
  });

  factory CurrentObservation.fromJson(Map<String, dynamic> json) =>
      CurrentObservation(
        pubDate: json["pubDate"],
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        atmosphere: json["atmosphere"] == null
            ? null
            : Atmosphere.fromJson(json["atmosphere"]),
        astronomy: json["astronomy"] == null
            ? null
            : Astronomy.fromJson(json["astronomy"]),
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
      );

  Map<String, dynamic> toJson() => {
        "pubDate": pubDate,
        "wind": wind?.toJson(),
        "atmosphere": atmosphere?.toJson(),
        "astronomy": astronomy?.toJson(),
        "condition": condition?.toJson(),
      };
}

class Astronomy {
  String? sunrise;
  String? sunset;

  Astronomy({
    this.sunrise,
    this.sunset,
  });

  factory Astronomy.fromJson(Map<String, dynamic> json) => Astronomy(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Atmosphere {
  int? humidity;
  int? visibility;
  double? pressure;

  Atmosphere({
    this.humidity,
    this.visibility,
    this.pressure,
  });

  factory Atmosphere.fromJson(Map<String, dynamic> json) => Atmosphere(
        humidity: json["humidity"],
        visibility: json["visibility"],
        pressure: json["pressure"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "humidity": humidity,
        "visibility": visibility,
        "pressure": pressure,
      };
}

class Condition {
  int? temperature;
  Text? text;
  int? code;

  Condition({
    this.temperature,
    this.text,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        temperature: json["temperature"],
        text: textValues.map[json["text"]]!,
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "text": textValues.reverse[text],
        "code": code,
      };
}

enum Text { PARTLY_CLOUDY, HOT, MOSTLY_CLOUDY }

final textValues = EnumValues({
  "Hot": Text.HOT,
  "Mostly Cloudy": Text.MOSTLY_CLOUDY,
  "Partly Cloudy": Text.PARTLY_CLOUDY
});

class Wind {
  int? chill;
  String? direction;
  int? speed;

  Wind({
    this.chill,
    this.direction,
    this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        chill: json["chill"],
        direction: json["direction"],
        speed: json["speed"],
      );

  Map<String, dynamic> toJson() => {
        "chill": chill,
        "direction": direction,
        "speed": speed,
      };
}

class Forecast {
  String? day;
  int? date;
  int? high;
  int? low;
  Text? text;
  int? code;

  Forecast({
    this.day,
    this.date,
    this.high,
    this.low,
    this.text,
    this.code,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        day: json["day"],
        date: json["date"],
        high: json["high"],
        low: json["low"],
        text: textValues.map[json["text"]]!,
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "date": date,
        "high": high,
        "low": low,
        "text": textValues.reverse[text],
        "code": code,
      };
}

class Location {
  String? city;
  int? woeid;
  String? country;
  double? lat;
  double? long;
  String? timezoneId;

  Location({
    this.city,
    this.woeid,
    this.country,
    this.lat,
    this.long,
    this.timezoneId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        woeid: json["woeid"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        timezoneId: json["timezone_id"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "woeid": woeid,
        "country": country,
        "lat": lat,
        "long": long,
        "timezone_id": timezoneId,
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
