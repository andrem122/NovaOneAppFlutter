part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStart extends LoginEvent {}

class LoginButtonTapped extends LoginEvent {
  final String email;
  final String password;

  @override
  List<Object> get props => super.props + [email, password];

  const LoginButtonTapped({required this.email, required this.password});
}
