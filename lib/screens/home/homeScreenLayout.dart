import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/home/bloc/home_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/utils/utils.dart';
import 'package:novaone/widgets/widgets.dart';

class HomeScreenLayout extends StatelessWidget {
  final String username;
  final String password;

  const HomeScreenLayout(
      {Key key, @required this.username, @required this.password})
      : assert(username != null),
        assert(password != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBloc();
    return BlocProvider(
      create: (BuildContext context) => homeBloc,
      child: StatefulWrapper(
        onInit: () => _submitUserByCredentials(
            password: password, username: username, homeBloc: homeBloc),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (state, context) => print(''),
          builder: (context, state) {
            if (state is HomeLoading) {
              return _buildLoading(context: context);
            }
            if (state is HomeLoaded) {
              return _buildLoaded(context: context, user: state.user);
            }
            return _buildError(context: context);
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

  Widget _buildLoaded({@required BuildContext context, @required User user}) {
    assert(context != null);
    assert(user != null);
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(
          user: user,
        ),
        landscape: HomeMobileLandscape(
          user: user,
        ),
      ),
    );
  }

  Widget _buildError({@required BuildContext context}) {
    return ErrorDisplay();
  }

  /// Submits the [username] and [password] to the bloc by dispatching an event to get a User object
  _submitUserByCredentials(
      {@required HomeBloc homeBloc,
      @required String username,
      @required String password}) {
    assert(username != null);
    assert(password != null);
    // Get the bloc
    homeBloc.add(HomeLogin(username, password));
  }
}
