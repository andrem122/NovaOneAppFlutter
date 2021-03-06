import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/api/apiMessageException.dart';
import 'package:novaone/api/chartDataApiClient.dart';
import 'package:novaone/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.futurePrefs,
    required this.chartDataApiClient,
    required this.leadsApiClient,
    required this.appointmentsApiClient,
  }) : super(HomeLoading());

  final Future<SharedPreferences> futurePrefs;
  final ChartDataApiClient chartDataApiClient;
  final LeadsApiClient leadsApiClient;
  final AppointmentsApiClient appointmentsApiClient;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStart) {
      yield* _start();
    }
  }

  /// Grabs all data needed to start up the home screen
  Stream<HomeState> _start() async* {
    // Indicate that the home screen is being loaded
    yield HomeLoading();

    // Fetch needed data from API
    try {
      final List<ChartMonthlyData> chartMonthlyData =
          await chartDataApiClient.getMonthyChartData();

      final List<Lead> recentLeads = await leadsApiClient.getRecentLeads();
      final List<Appointment> recentAppointments =
          await appointmentsApiClient.getRecentAppointments();

      // Once user data is fetched, dispatch the HomeLoaded state
      yield HomeLoaded(
          chartMonthlyData: chartMonthlyData,
          recentLeads: recentLeads,
          recentAppointments: recentAppointments);
    } catch (error, stacktrace) {
      yield HomeError();
      print(stacktrace);
      if (error is ApiMessageException) {
        print('Error on HomeStart: ${error.reason}');
      } else {
        print('Error on HomeStart: $error');
      }
    }
  }
}
