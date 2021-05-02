import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/screens/settings/bloc/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLayout extends StatelessWidget {
  final User user;

  const SettingsLayout({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsBloc(
          futurePrefs: context.read<Future<SharedPreferences>>(),
          context: context),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return _buildLoaded(context: context);
        },
        listener: (BuildContext context, SettingsState state) {},
      ),
    );
  }

  Widget _buildLoaded({required BuildContext context}) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: SettingsMobilePortrait(user: user),
      ),
    );
  }
}
