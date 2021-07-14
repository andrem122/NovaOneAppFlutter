part of 'nav_screen_bloc.dart';

abstract class NavScreenEvent extends Equatable {
  const NavScreenEvent();

  @override
  List<Object> get props => [];
}

/// The navigation's screen's initial event
class NavScreenStart extends NavScreenEvent {}
