import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/login/bloc/login_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:novaone/extensions/extensions.dart';

/// Consumes the Bloc
class LoginScreenLayout extends StatefulWidget {
  @override
  _LoginScreenLayoutState createState() => _LoginScreenLayoutState();
}

class _LoginScreenLayoutState extends State<LoginScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc()..add(LoginStart()),
      child: Scaffold(
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
              // Navigate the user to the home screen
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

  Widget _buildError({@required BuildContext context}) {
    return ErrorDisplay();
  }
}
