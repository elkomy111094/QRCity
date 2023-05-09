import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_filter_state.dart';

class HomeFilterCubit extends Cubit<HomeFilterState> {
  HomeFilterCubit() : super(HomeFilterInitial());

  static HomeFilterCubit get(context) => BlocProvider.of(context);

  int filterRate = 0;
  bool restFilter = false;
  bool coffeeFilter = true;

  changeRestFilter(bool state) {
    restFilter = state;
    emit(RestFilterChange());
  }

  changeFilterRate(int typeId) {
    filterRate = typeId;
    emit(FilterRateChange());
  }

  changCoffeeFilter(bool state) {
    coffeeFilter = state;
    emit(CoffeeFilterChange());
  }
}
