part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// Home page loading state
class HomeLoading extends HomeState {
  @override
  List<Object> get props => super.props + [];
}

// Home page loaded state
class HomeLoaded extends HomeState {
  final List<ChartMonthlyData> chartMonthlyData;
  final List<Lead> recentLeads;
  final List<Appointment> recentAppointments;

  HomeLoaded({
    required this.chartMonthlyData,
    required this.recentLeads,
    required this.recentAppointments,
  });

  @override
  List<Object> get props => super.props + [];
}

// Home page error state
class HomeError extends HomeState {
  @override
  List<Object> get props => super.props + [];
}
