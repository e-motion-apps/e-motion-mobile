import 'package:emotion/src/features/home/presentation/bloc/home_event.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(cityName: '', countryName: '' , email: '', password: '' , name: '', isUserLoggedIn: false)) {
    on<CityNameChanged>((event, emit) {
      emit(state.copyWith(cityName: event.cityName,));
    });

    on<CountryNameChanged>((event, emit) {
      emit(state.copyWith(countryName: event.countryName));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<UserLoggedIn>((event, emit) {
      emit(state.copyWith(isUserLoggedIn: event.isUserLoggedIn));
    });

  }
}
