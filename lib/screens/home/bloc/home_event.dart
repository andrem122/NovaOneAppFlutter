part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// User logs in and is taken to the home page
class HomeLogin extends HomeEvent {
  final String username;
  final String password;

  const HomeLogin(this.username, this.password);
}

// An info card on the home page is tapped
class HomeInfoCardTapped extends HomeState {}
