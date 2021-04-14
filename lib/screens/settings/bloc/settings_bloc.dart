import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:novaone/screens/login/loginLayout.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Future<SharedPreferences> futurePrefs;
  final BuildContext context;

  SettingsBloc({@required this.futurePrefs, @required this.context})
      : assert(futurePrefs != null),
        assert(context != null),
        super(SettingsInitial());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    final prefs = await futurePrefs;
    // Sign the user out since they tapped on the sign out option
    if (event is SettingsSignOutTapped) {
      // Clear all user preferences
      prefs.clear();

      // Navigate the user to the login screen
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => LoginScreenLayout()));
    }
  }
}
