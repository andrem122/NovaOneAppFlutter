import 'package:novaone/models/user.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'models/models.dart';

final User currentUser = User(
    id: 1,
    userId: 3213,
    password: 'password',
    lastLogin: '2020-12-30 12:00:00 PM',
    username: 'andrem122',
    firstName: 'John',
    lastName: 'Berman',
    email: 'test@mail.com',
    dateJoined: '2020-12-30 12:00:00 PM',
    isPaying: false,
    wantsEmailNotifications: false,
    wantsSms: false,
    phoneNumber: '555-555-5555',
    customerType: 'PM');

// Sample chart data
final List<LeadsPerMonth> leadsPerMonthChartData = [
  LeadsPerMonth(date: 'Jan\n20', numberOfleads: 24),
  LeadsPerMonth(date: 'Feb\n20', numberOfleads: 42),
  LeadsPerMonth(date: 'Mar\n20', numberOfleads: 9),
  LeadsPerMonth(date: 'Apr\n20', numberOfleads: 36),
  LeadsPerMonth(date: 'May\n20', numberOfleads: 22),
  LeadsPerMonth(date: 'Jun\n20', numberOfleads: 17),
  LeadsPerMonth(date: 'Jul\n20', numberOfleads: 48),
  LeadsPerMonth(date: 'Aug\n20', numberOfleads: 46),
  LeadsPerMonth(date: 'Sep\n20', numberOfleads: 5),
  LeadsPerMonth(date: 'Oct\n20', numberOfleads: 19),
  LeadsPerMonth(date: 'Nov\n20', numberOfleads: 67),
  LeadsPerMonth(date: 'Dec\n20', numberOfleads: 70),
];

final List<charts.Series<LeadsPerMonth, String>> seriesList = [
  charts.Series(
    id: 'Leads',
    domainFn: (LeadsPerMonth leadsPerMonth, _) => leadsPerMonth.date,
    measureFn: (LeadsPerMonth leadsPerMonth, _) => leadsPerMonth.numberOfleads,
    data: leadsPerMonthChartData,
  ),
];
