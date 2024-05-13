import 'package:emotion/src/features/home/presentation/bloc/home_event.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(cityName: '', countryName: ''));

Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is CityNameChanged) {
      yield state.copyWith(cityName: event.cityName);
    } else if (event is CountryNameChanged) {
      yield state.copyWith(countryName: event.countryName);
    }

  }
}
