import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';

part 'nav_screen_event.dart';
part 'nav_screen_state.dart';

class NavScreenBloc extends Bloc<NavScreenEvent, NavScreenState> {
  final LeadsApiClient leadsApiClient;
  final AppointmentsApiClient appointmentsApiClient;
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

  NavScreenBloc(
      {required this.leadsApiClient, required this.appointmentsApiClient})
      : super(NavScreenLoaded(appointmentTableItems: [], leadTableItems: []));

  @override
  Stream<NavScreenState> mapEventToState(
    NavScreenEvent event,
  ) async* {
    yield* _start();
  }

  // Handles the startup of the navigation screen
  Stream<NavScreenState> _start() async* {
    try {
      /// Get recent leads and appointments
      final List<Lead> leads = await leadsApiClient.getRecentLeads();
      final List<Appointment> appointments =
          await appointmentsApiClient.getRecentAppointments();

      /// Convert to table items
      final List<NovaOneListTableItemData> leadTableItems = leads
          .map((Lead lead) => NovaOneListTableItemData(
              popupMenuOptions: listPopupMenuOptions,
              subtitle: DateFormat('MMM dd').format(lead.dateOfInquiry),
              title: lead.name))
          .toList();
      final List<NovaOneListTableItemData> appointmentTableItems = appointments
          .map((Appointment appointment) => NovaOneListTableItemData(
              popupMenuOptions: listPopupMenuOptions,
              subtitle: DateFormat('MMM dd').format(appointment.time),
              title: appointment.name))
          .toList();

      yield NavScreenLoaded(
          leadTableItems: leadTableItems,
          appointmentTableItems: appointmentTableItems);
    } catch (error, stackTrace) {
      yield NavScreenError(error: error.toString(), stackTrace: stackTrace);
    }
  }
}
