import 'package:flutter/material.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/widgets/widgets.dart';

import '../../testData.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
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
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.perm_contact_calendar,
    Icons.people_alt,
    Icons.settings,
    Icons.business,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          children: _screens,
          index: _selectedIndex,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
