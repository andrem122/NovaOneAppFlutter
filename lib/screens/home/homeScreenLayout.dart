import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/home/bloc/home_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/widgets/widgets.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBloc();
    return BlocProvider(
      create: (BuildContext context) => homeBloc..add(HomeStart()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (state, context) => print(''),
        builder: (context, state) {
          if (state is HomeLoading) {
            return _buildLoading(context: context);
          }
          if (state is HomeLoaded) {
            return _buildLoaded(context: context);
          }
          return _buildError(context: context);
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
        portrait: HomeMobilePortrait(),
        landscape: HomeMobileLandscape(),
      ),
    );
  }

  Widget _buildError({@required BuildContext context}) {
    return ErrorDisplay();
  }
}
