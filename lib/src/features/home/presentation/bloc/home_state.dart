      class HomeState {
        final String cityName;
        final String countryName;

        final String name;
        final String email;
        final String password;

        final bool isUserLoggedIn;
      

        HomeState({required this.cityName, required this.countryName , required this.email, required this.password, required this.name , required this.isUserLoggedIn});

        HomeState copyWith({String? cityName, String? countryName, String? name ,String? email, String? password, bool? isUserLoggedIn}) {
          return HomeState(
            cityName: cityName ?? this.cityName,
            countryName: countryName ?? this.countryName,
            name: name ?? this.name,
            email: email ?? this.email,
            password: password ?? this.password,
            isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
          );
        }
      }
