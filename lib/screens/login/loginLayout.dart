import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/auth/auth.dart';
import 'package:novaone/constants.dart';
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
  bool _load = false;
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
          listener: (state, context) {
            setState(() {
              _load = false;
            });
          },
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
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _load = true;
                });
              });
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

class NovaOneLoadingIndicator extends StatelessWidget {
  final String title;

  const NovaOneLoadingIndicator({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(containerBorderRadius)),
      width: 100.0,
      height: 100.0,
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              const SizedBox(
                height: 10,
              ),
              Text(
                title ?? '',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ))),
    );
  }
}
