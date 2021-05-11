import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:novaone/api/chartDataApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.futurePrefs, required this.chartDataApiClient})
      : super(HomeLoading());

  final Future<SharedPreferences> futurePrefs;
  final ChartDataApiClient chartDataApiClient;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStart) {
      // Indicate that the home screen is being loaded
      yield HomeLoading();

      // Fetch needed data from API
      try {
        final chartData = await chartDataApiClient.getMonthyChartData();
        print(chartData);
      } catch (error, stacktrace) {
        print(stacktrace);
      }
      // Once user data is fetched, dispatch the HomeLoaded state
      yield HomeLoaded();
    }
  }
}
