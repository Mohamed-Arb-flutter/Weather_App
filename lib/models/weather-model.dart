class Weathermodel {
  final String cityname;
  final DateTime date;
  final String? image;
  final double maxtimp;
  final double mintimp;
  final double avrage;
  final String condthion;

  Weathermodel({
    required this.cityname,
    required this.date,
    this.image,
    required this.maxtimp,
    required this.mintimp,
    required this.avrage,
    required this.condthion,
  });
  factory Weathermodel.fromjeson(jeson) {
    return Weathermodel(
      image: jeson['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityname: jeson['location']['name'],
      date: DateTime.parse(jeson['current']['last_updated']),
      maxtimp: jeson['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintimp: jeson['forecast']['forecastday'][0]['day']['mintemp_c'],
      avrage: jeson['forecast']['forecastday'][0]['day']['avgtemp_c'],
      condthion:
          jeson['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
