part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => super.props + [];
}

// The login screen has been loaded
class LoginLoaded extends LoginState {
  @override
  List<Object> get props => super.props + [];
}

// The login screen had an error
class LoginError extends LoginState {
  @override
  List<Object> get props => super.props + [];
}

// The user has logged in
class LoginUser extends LoginState {}
