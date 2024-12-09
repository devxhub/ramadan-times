import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCubit extends Cubit<String> {
  CountryCubit() : super('');
  selectedCountry(String value){
    emit(value);
  }
}

class CityCubit extends Cubit<String> {
  CityCubit() : super('');
  selectedCity(String value){
    emit(value);
  }
}