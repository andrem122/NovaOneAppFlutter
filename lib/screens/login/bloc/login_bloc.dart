import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/authentication/authentication.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({@required this.futurePrefs, @required this.context})
      : assert(futurePrefs != null),
        super(LoginLoaded());

  final Future<SharedPreferences> futurePrefs;
  final BuildContext context;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    /// Check to see if the user is logged in
    /// If the user is logged in, then direct them to the home page
    // TODO: Check to see if the user has credentials by using the UserStore.hasCredentials method
    final SharedPreferences prefs = await futurePrefs;
    final bool userIsLoggedIn =
        prefs.getBool(UserKeys.instance.userLoggedIn) ?? false;
    if (event is LoginStart && userIsLoggedIn == false) {
      yield LoginLoaded();
    }

    // User is logged in and is starting the app again
    if (event is LoginStart && userIsLoggedIn == true) {
      // Auto login the user with the saved password and username
    }

    if (event is LoginButtonTapped) {
      yield LoginLoading();

      // Get the user data from the NovaOne API
      final Client client = Client();
      final UserApiClient userApiClient = UserApiClient(client: client);

      final response = await userApiClient.getUser(
          email: event.email, password: event.password);

      if (response.runtimeType == User) {
        // User has been logged in so keep track of login status
        // password, and username/email to
        // allow the user to not have to login again
        final SharedPreferences prefs = await futurePrefs;
        prefs.setBool(UserKeys.instance.userLoggedIn, true);

        // TODO: Store user name and password in secure storage using UserStore class
        // You can get the UserStore instance by calling context.read<UserStore>()
        yield LoginUser(user: response);
      } else {
        yield LoginError(error: response);
      }
    }
  }
}
