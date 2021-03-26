part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// User logs in and is taken to the home page
class HomeStart extends HomeEvent {}

// An info card on the home page is tapped
class HomeInfoCardTapped extends HomeState {}
