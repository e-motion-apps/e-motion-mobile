abstract class HomeEvent {}

class CityNameChanged extends HomeEvent {
  final String cityName;

  CityNameChanged({required this.cityName});
}

class CountryNameChanged extends HomeEvent {
  final String countryName;

  CountryNameChanged({required this.countryName});
}
