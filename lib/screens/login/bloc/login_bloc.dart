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
        final String username = await userStore.getUsername();
        final String password = await userStore.getPassword();

        final user =
            await userApiClient.getUser(username: username, password: password);
        yield LoginUser(user: user);
      } catch (error) {
        print('LoginStart: $error');
      }
    }

    // User is logged in and is starting the app again
    if (event is LoginStart && userIsLoggedIn == true) {
      // Auto login the user with the saved password and username
    }

    if (event is LoginButtonTapped) {
      yield LoginLoading();

      try {
        final user = await userApiClient.getUser(
            username: event.email, password: event.password);

        // User has been logged in so keep track of login status
        // password, and username/email to
        // allow the user to not have to login again
        final SharedPreferences prefs = await futurePrefs;
        prefs.setBool(UserKeys.instance.userLoggedIn, true);
        userStore.storeCredentials(
            password: event.email, username: event.password);

        yield LoginUser(user: user);
      } catch (error) {
        print('LoginButtonTapped error: $error');
        yield LoginError(error: error);
      }
    }
  }
}
