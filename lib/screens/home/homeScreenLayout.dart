import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/api/chartDataApiClient.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/home/bloc/home_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBloc(
        futurePrefs: context.read<Future<SharedPreferences>>(),
        chartDataApiClient: context.read<ChartDataApiClient>());
    return BlocProvider(
      create: (BuildContext context) => homeBloc..add(HomeStart()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (state, context) => print(''),
        builder: (context, state) {
          if (state is HomeLoading) {
            return _buildLoading(context: context);
          }
          if (state is HomeLoaded) {
            return _buildLoaded(context: context, state: state);
          }

          return _buildError(context: context);
        },
      ),
    );
  }

  Widget _buildLoading({required BuildContext context}) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoaded(
      {required BuildContext context, required HomeLoaded state}) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(
          state: state,
        ),
        landscape: HomeMobileLandscape(),
      ),
    );
  }

  Widget _buildError({required BuildContext context}) {
    return ErrorDisplay();
  }
}
