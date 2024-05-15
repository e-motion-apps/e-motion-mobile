      class HomeState {
        final String cityName;
        final String countryName;
        final String email;
        final String password;
      

        HomeState({required this.cityName, required this.countryName , required this.email, required this.password});

        HomeState copyWith({String? cityName, String? countryName, String? email, String? password}) {
          return HomeState(
            cityName: cityName ?? this.cityName,
            countryName: countryName ?? this.countryName,
            email: email ?? this.email,
            password: password ?? this.password,
          );
        }
      }
