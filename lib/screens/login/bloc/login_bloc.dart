import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/auth/auth.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      {@required this.futurePrefs,
      @required this.context,
      @required this.userApiClient,
      @required this.userStore})
      : assert(futurePrefs != null),
        assert(userStore != null),
        assert(context != null),
        assert(userApiClient != null),
        super(LoginLoaded());

  final Future<SharedPreferences> futurePrefs;
  final UserStore userStore;
  final BuildContext context;
  final UserApiClient userApiClient;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    final SharedPreferences prefs = await futurePrefs;
    final bool userIsLoggedIn =
        prefs.getBool(UserKeys.instance.userLoggedIn) ?? false;
    final bool hasCredentials = await userStore.hasCredentials();

    /// Check to see if the user is logged in
    /// If the user is logged in, then grab user object and direct them to the home page
    if (event is LoginStart && userIsLoggedIn && hasCredentials) {
      try {
        final String email = await userStore.getEmail();
        final String password = await userStore.getPassword();

        // Get the user object from the API
        final user =
            await userApiClient.getUser(email: email, password: password);
        yield LoginUser(user: user);
      } catch (error) {
        final String errorMessage =
            error is ApiMessageException ? error.reason : error.toString();
        final ApiMessageException errorObject = error is ApiMessageException
            ? error
            : ApiMessageException(reason: error.toString(), error: 0);
        print('LoginStart Error: $errorMessage');
        yield LoginError(error: errorObject);
      }
    }

    if (event is LoginButtonTapped) {
      yield LoginLoading();

      try {
        final user = await userApiClient.getUser(
            email: event.email, password: event.password);

        // User has been logged in so keep track of login status
        // password, and username/email to
        // allow the user to not have to login again
        final SharedPreferences prefs = await futurePrefs;
        prefs.setBool(UserKeys.instance.userLoggedIn, true);
        userStore.storeCredentials(
            password: event.password, email: event.email);

        yield LoginUser(user: user);
      } catch (error) {
        if (error is ApiMessageException) {
          final String errorMessage =
              error is ApiMessageException ? error.reason : error.toString();
          final ApiMessageException errorObject = error is ApiMessageException
              ? error
              : ApiMessageException(reason: error.toString(), error: 0);
          print('LoginButtonTapped Error: $errorMessage');
          yield LoginError(error: errorObject);
        }
      }
    }
  }
}
