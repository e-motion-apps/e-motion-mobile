      class HomeState {
        final String cityName;
        final String countryName;

        HomeState({required this.cityName, required this.countryName});

        HomeState copyWith({String? cityName, String? countryName}) {
          return HomeState(
            cityName: cityName ?? this.cityName,
            countryName: countryName ?? this.countryName,
          );
        }
      }
