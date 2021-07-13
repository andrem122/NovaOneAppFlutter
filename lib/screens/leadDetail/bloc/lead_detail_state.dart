part of 'lead_detail_bloc.dart';

abstract class LeadDetailState extends Equatable {
  const LeadDetailState();

  @override
  List<Object> get props => [];
}

class LeadDetailLoaded extends LeadDetailState {}

class LeadDetailError extends LeadDetailState {
  final String error;
  final StackTrace stackTrace;

  LeadDetailError({required this.error, required this.stackTrace});
}
