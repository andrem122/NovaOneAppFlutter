import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

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

final List<Lead> recentLeads = [
  Lead(
      id: 1,
      name: 'John Wilkin',
      phoneNumber: '561-346-5571',
      email: 'andre.mashraghi@gmail.com',
      dateOfInquiry: '2020-08-30 15:32:23 +00',
      renterBrand: 'Zillow',
      companyId: 2,
      sentTextDate: '2020-08-30 15:32:23 +00',
      sentEmailDate: '2020-08-30 15:32:23 +00',
      filledOutForm: false,
      madeAppointment: false,
      companyName: 'NovaOne'),
  Lead(
      id: 1,
      name: 'Jakob Brown',
      phoneNumber: '561-346-5571',
      email: 'andre.mashraghi@gmail.com',
      dateOfInquiry: '2020-08-30 15:32:23 +00',
      renterBrand: 'Zillow',
      companyId: 2,
      sentTextDate: '2020-08-30 15:32:23 +00',
      sentEmailDate: '2020-08-30 15:32:23 +00',
      filledOutForm: false,
      madeAppointment: false,
      companyName: 'NovaOne'),
  Lead(
      id: 1,
      name: 'Bob Diller',
      phoneNumber: '561-346-5571',
      email: 'andre.mashraghi@gmail.com',
      dateOfInquiry: '2020-08-30 15:32:23 +00',
      renterBrand: 'Zillow',
      companyId: 2,
      sentTextDate: '2020-08-30 15:32:23 +00',
      sentEmailDate: '2020-08-30 15:32:23 +00',
      filledOutForm: false,
      madeAppointment: false,
      companyName: 'NovaOne'),
  Lead(
      id: 1,
      name: 'Tommy Johns',
      phoneNumber: '561-346-5571',
      email: 'andre.mashraghi@gmail.com',
      dateOfInquiry: '2020-08-30 15:32:23 +00',
      renterBrand: 'Zillow',
      companyId: 2,
      sentTextDate: '2020-08-30 15:32:23 +00',
      sentEmailDate: '2020-08-30 15:32:23 +00',
      filledOutForm: false,
      madeAppointment: false,
      companyName: 'NovaOne'),
  Lead(
      id: 1,
      name: 'Bobby Johns',
      phoneNumber: '561-346-5571',
      email: 'andre.mashraghi@gmail.com',
      dateOfInquiry: '2020-08-30 15:32:23 +00',
      renterBrand: 'Zillow',
      companyId: 2,
      sentTextDate: '2020-08-30 15:32:23 +00',
      sentEmailDate: '2020-08-30 15:32:23 +00',
      filledOutForm: false,
      madeAppointment: false,
      companyName: 'NovaOne'),
];

final List<Appointment> recentAppointments = [
  Appointment(
      id: 1,
      name: 'John Doe',
      phoneNumber: '561-346-5571',
      time: '2020-08-30 15:32:23 +00',
      timeZone: 'United_States/America',
      confirmed: false,
      companyId: 1),
  Appointment(
      id: 2,
      name: 'Thomas Button',
      phoneNumber: '561-346-5571',
      time: '2020-08-30 15:32:23 +00',
      timeZone: 'United_States/America',
      confirmed: false,
      companyId: 1),
  Appointment(
      id: 3,
      name: 'Benjamin Button',
      phoneNumber: '561-346-5571',
      time: '2020-08-30 15:32:23 +00',
      timeZone: 'United_States/America',
      confirmed: false,
      companyId: 1),
  Appointment(
      id: 4,
      name: 'Johhny Rockets',
      phoneNumber: '561-346-5571',
      time: '2020-08-30 15:32:23 +00',
      timeZone: 'United_States/America',
      confirmed: false,
      companyId: 1),
  Appointment(
      id: 5,
      name: 'Sarah Bateman',
      phoneNumber: '561-346-5571',
      time: '2020-08-30 15:32:23 +00',
      timeZone: 'United_States/America',
      confirmed: false,
      companyId: 1),
];
