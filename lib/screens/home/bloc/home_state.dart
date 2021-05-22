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

  HomeLoaded({required this.chartMonthlyData});

  @override
  List<Object> get props => super.props + [];
}

// Home page error state
class HomeError extends HomeState {
  @override
  List<Object> get props => super.props + [];
}
