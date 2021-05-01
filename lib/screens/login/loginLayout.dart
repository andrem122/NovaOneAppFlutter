import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/auth/auth.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/login/bloc/login_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/extensions/extensions.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Consumes the Bloc
class LoginScreenLayout extends StatefulWidget {
  @override
  _LoginScreenLayoutState createState() => _LoginScreenLayoutState();
}

class _LoginScreenLayoutState extends State<LoginScreenLayout> {
  bool _load = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (BuildContext context, LoginState state) {
            setState(() {
              _load = false;
            });

            if (state is LoginUser) {
              print('STATE IS LoginUser');

              /// Navigate the user to the navigation screen
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RepositoryProvider(
                      create: (BuildContext context) => state.user,
                      child: NavScreen())));
            }

            if (state is LoginLoading) {
              print('STATE IS LoginLoading');
              setState(() {
                _load = true;
              });
            }
          },
          builder: (BuildContext context, LoginState state) {
            if (state is LoginError) {
              print('STATE IS LoginError');
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Scaffold message can only be called once the build has completed so
                // we need to wrap our error message with the addPostFrameCallback method
                Scaffold.of(context)
                    .showErrorSnackBar(error: state.error.reason);
              });
            }

            if (state is LoginLoaded) {
              return _buildLoaded(context: context);
            }

            return _buildLoaded(context: context);
          },
        ),
      ),
    );
  }

  Widget _buildLoaded({@required BuildContext context}) {
    assert(context != null);
    Widget loadingIndicator = _load
        ? NovaOneLoadingIndicator(
            title: 'Logging In',
          )
        : SizedBox.shrink();
    return Stack(
      children: <Widget>[
        ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: LoginMobilePortrait(),
            landscape: LoginMobileLandscape(),
          ),
          tablet: LoginTabletPortrait(),
          desktop: LoginDesktopPortrait(),
        ),
        new Align(
          child: loadingIndicator,
          alignment: FractionalOffset.center,
        ),
      ],
    );
  }
}
