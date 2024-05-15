      class HomeState {
        final String cityName;
        final String countryName;

        final String name;
        final String email;
        final String password;
      

        HomeState({required this.cityName, required this.countryName , required this.email, required this.password, required this.name});

        HomeState copyWith({String? cityName, String? countryName, String? name ,String? email, String? password}) {
          return HomeState(
            cityName: cityName ?? this.cityName,
            countryName: countryName ?? this.countryName,
            name: name ?? this.name,
            email: email ?? this.email,
            password: password ?? this.password,
          );
        }
      }
