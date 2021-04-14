part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

/// The event that occurs when the sign out option is tapped on the settings page
class SettingsSignOutTapped extends SettingsEvent {}
