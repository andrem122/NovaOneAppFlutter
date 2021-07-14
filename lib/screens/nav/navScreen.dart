import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/api/chartDataApiClient.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/screens/home/bloc/home_bloc.dart';
import 'package:novaone/screens/nav/bloc/nav_screen_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/screens/settings/bloc/settings_bloc.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../testData.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);
  @override
  NavScreenState createState() => NavScreenState();
}

class NavScreenState extends State<NavScreen> {
  late List<Widget> _screens;
  List<IconData>? _icons;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    /// Initialize the screens to show for the navigation
    _screens = [
      HomeScreenLayout(),
      NovaOneListObjectsLayout(
        tableItems: allAppointments,
        addListObjectDescription:
            'Add the name of the person you have an appointment with.',
        title: 'All Appointments',
        heroTag: 'add_appointment',
      ),
      NovaOneListObjectsLayout(
        tableItems: allLeads,
        addListObjectDescription: 'Add the name of the lead.',
        title: 'All Leads',
        heroTag: 'add_lead',
      ),
      SettingsLayout(
        user: context.read<User>(),
      ),
      NovaOneListObjectsLayout(
        tableItems: allLeads,
        addListObjectDescription: 'Add the name of the company.',
        title: 'All Companies',
        heroTag: 'add_company',
      ),
    ];

    _icons = const [
      Icons.home,
      Icons.perm_contact_calendar,
      Icons.people_alt,
      Icons.settings,
      Icons.business,
    ];
  }

  /// Creates some of the blocs needed throughout the app
  ///
  /// Some blocs have to be created in the widget itself
  List<BlocProvider> _createBlocs() {
    return <BlocProvider>[
      BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(
            futurePrefs: context.read<Future<SharedPreferences>>(),
            chartDataApiClient: context.read<ChartDataApiClient>(),
            leadsApiClient: context.read<LeadsApiClient>(),
            appointmentsApiClient: context.read<AppointmentsApiClient>())
          ..add(HomeStart()),
      ),
      BlocProvider<SettingsBloc>(
        create: (BuildContext context) => SettingsBloc(
            futurePrefs: context.read<Future<SharedPreferences>>(),
            context: context),
      ),
      BlocProvider<NavScreenBloc>(
        create: (BuildContext context) => NavScreenBloc(
          leadsApiClient: context.read<LeadsApiClient>(),
          appointmentsApiClient: context.read<AppointmentsApiClient>(),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _createBlocs(),
      child: DefaultTabController(
        length: _icons!.length,
        child: Scaffold(
          body: IndexedStack(
            children: _screens,
            index: selectedIndex,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomTabBar(
              icons: _icons,
              selectedIndex: selectedIndex,
              onTap: (index) => setState(() => selectedIndex = index),
            ),
          ),
        ),
      ),
    );
  }
}
