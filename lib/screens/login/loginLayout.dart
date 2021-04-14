import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/auth/auth.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/login/bloc/login_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Consumes the Bloc
class LoginScreenLayout extends StatefulWidget {
  @override
  _LoginScreenLayoutState createState() => _LoginScreenLayoutState();
}

class _LoginScreenLayoutState extends State<LoginScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(
          futurePrefs: context.read<Future<SharedPreferences>>(),
          context: context,
          userApiClient: context.read<UserApiClient>(),
          userStore: context.read<UserStore>())
        ..add(LoginStart()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (state, context) => print(''),
          builder: (context, state) {
            if (state is LoginLoaded) {
              return _buildLoaded(context: context);
            }

            if (state is LoginError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Scaffold message can only be called once the build has completed so
                // we need to wrap our error message with the addPostFrameCallback method
                Scaffold.of(context)
                    .showErrorSnackBar(error: state.error.reason);
              });
            }

            if (state is LoginLoading) {
              return _buildLoading(context: context);
            }

            if (state is LoginUser) {
              /// Navigate the user to the navigation screen
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavScreen(
                          user: state.user,
                        )));
              });
            }
            return _buildLoaded(context: context);
          },
        ),
      ),
    );
  }

  Widget _buildLoading({@required BuildContext context}) {
    assert(context != null);
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoaded({@required BuildContext context}) {
    assert(context != null);
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: LoginMobilePortrait(),
        landscape: LoginMobileLandscape(),
      ),
      tablet: LoginTabletPortrait(),
      desktop: LoginDesktopPortrait(),
    );
  }
}
