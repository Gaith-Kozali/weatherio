class Location {
  Location(
      {required this.country,
      required this.city,
      required this.lat,
      required this.lon});
  String country;
  String city;
  String lon;
  String lat;

  factory Location.fromJson(final json) {
    return Location(
        city: json[0]['name'],
        country: json[0]['country'],
        lat: json[0]['lat'].toString(),
        lon: json[0]['lon'].toString());
  }
}
