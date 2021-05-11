import 'package:flutter/material.dart';

import 'enums/enums.dart';
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

final List<PopupMenuEntry> listPopupMenuOptions = [
  PopupMenuItem(
    value: ListTableItemMenuOptions.Call,
    child: Text('Call'),
  ),
  PopupMenuItem(
    value: ListTableItemMenuOptions.Text,
    child: Text('Text'),
  ),
  PopupMenuItem(
    value: ListTableItemMenuOptions.Email,
    child: Text('Email'),
  ),
  PopupMenuItem(
    value: ListTableItemMenuOptions.View,
    child: Text('View'),
  ),
];

// List of pop up menu options for settings
final List<PopupMenuEntry> settingsPopupMenuOptions = [
  PopupMenuItem(
    value: ListTableItemMenuOptions.Edit,
    child: Text('Edit'),
  ),
  PopupMenuItem(
    value: ListTableItemMenuOptions.Copy,
    child: Text('Copy'),
  ),
];

final List<NovaOneListTableItemData> allAppointments = [
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
];

final List<NovaOneListTableItemData> allLeads = [
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
  NovaOneListTableItemData(
      popupMenuOptions: listPopupMenuOptions,
      subtitle: 'Dec 25',
      title: 'John Berry'),
];
