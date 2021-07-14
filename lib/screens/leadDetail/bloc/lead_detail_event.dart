part of 'lead_detail_bloc.dart';

abstract class LeadDetailEvent extends Equatable {
  const LeadDetailEvent();

  @override
  List<Object> get props => [];
}

/// The lead detail screen's initial event
class LeadDetailStart extends LeadDetailEvent {}
