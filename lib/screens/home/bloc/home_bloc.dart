import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/testData.dart';
import 'package:novaone/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({@required this.futurePrefs}) : super(HomeLoading());

  final Future<SharedPreferences> futurePrefs;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStart) {
      // Once user data is fetched, dispatch the HomeLoaded state
      yield HomeLoaded();
    }
  }
}
