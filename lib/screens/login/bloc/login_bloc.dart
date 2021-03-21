import 'dart:async';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoaded());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginStart) {
      yield LoginLoaded();
    }

    if (event is LoginButtonTapped) {
      yield LoginLoading();

      // Get the user data from the API
      final Client client = Client();
      final UserApiClient userApiClient = UserApiClient(client: client);

      final response = await userApiClient.getUser(
          email: event.email, password: event.password);

      if (response.runtimeType == User) {
        yield LoginUser(user: response);
      } else {
        yield LoginError(error: response);
      }
    }
  }
}
