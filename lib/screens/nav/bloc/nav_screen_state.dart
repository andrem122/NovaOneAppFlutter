part of 'nav_screen_bloc.dart';

abstract class NavScreenState extends Equatable {
  const NavScreenState();

  @override
  List<Object> get props => [];
}

class NavScreenLoaded extends NavScreenState {
  /// The leads to show on startup of the nav screen
  final List<NovaOneListTableItemData> leadTableItems;

  /// The appointments to show on startup of the nav screen
  final List<NovaOneListTableItemData> appointmentTableItems;

  NavScreenLoaded(
      {required this.leadTableItems, required this.appointmentTableItems});
}

class NavScreenError extends NavScreenState {
  final String error;
  final StackTrace stackTrace;

  NavScreenError({required this.error, required this.stackTrace});
}
