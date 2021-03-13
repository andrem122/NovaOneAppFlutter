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
  final User user;

  const HomeLoaded(this.user);

  @override
  List<Object> get props => super.props + [this.user];
}

// Home page error state
class HomeError extends HomeState {
  @override
  List<Object> get props => super.props + [];
}
