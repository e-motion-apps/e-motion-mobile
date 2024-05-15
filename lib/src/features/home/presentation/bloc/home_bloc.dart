import 'package:emotion/src/features/home/presentation/bloc/home_event.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(cityName: '', countryName: '' , email: '', password: '')) {
    on<CityNameChanged>((event, emit) {
      emit(state.copyWith(cityName: event.cityName,));
    });

    on<CountryNameChanged>((event, emit) {
      emit(state.copyWith(countryName: event.countryName));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

  }
}
