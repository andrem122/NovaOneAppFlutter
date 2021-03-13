import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/testData.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeLogin) {
      // Dispatch the loading state first
      yield HomeLoading();

      // Fetch user data from API
      final User user = await _fetchUserFromFakeApi(
          username: event.username, password: event.password);

      // Once user data is fetched, dispatch the HomeLoaded state
      yield HomeLoaded(user);
    }
  }
}

Future<User> _fetchUserFromFakeApi(
    {@required String username, @required String password}) {
  return Future.delayed(Duration(seconds: 2), () => currentUser);
}
