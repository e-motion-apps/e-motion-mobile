abstract class HomeEvent {}

class CityNameChanged extends HomeEvent {
  final String cityName;

  CityNameChanged({required this.cityName});
}

class CountryNameChanged extends HomeEvent {
  final String countryName;

  CountryNameChanged({required this.countryName});
}

class EmailChanged extends HomeEvent {
  final String email;

  EmailChanged({required this.email});
}

class PasswordChanged extends HomeEvent {
  final String password;

  PasswordChanged({required this.password});
}

class SignInWithEmailAndPasswordPressed extends HomeEvent {
  final String email;
  final String password;

  SignInWithEmailAndPasswordPressed({required this.email, required this.password});
}

class GetCityDetailsPressed extends HomeEvent {
  final String cityName;
  final String countryName;

  GetCityDetailsPressed({required this.cityName, required this.countryName});
}
