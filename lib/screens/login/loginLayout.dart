import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/login/bloc/login_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/widgets/widgets.dart';

class LoginScreenLayout extends StatelessWidget {
  const LoginScreenLayout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    return BlocProvider(
      create: (BuildContext context) => loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (state, context) => print(''),
        builder: (context, state) {
          if (state is LoginLoaded) {
            return _buildLoaded(context: context);
          }
          //return _buildError(context: context);
          return _buildLoaded(context: context);
        },
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
    );
  }

  Widget _buildError({@required BuildContext context}) {
    return ErrorDisplay();
  }
}
