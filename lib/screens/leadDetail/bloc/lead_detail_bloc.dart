import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lead_detail_event.dart';
part 'lead_detail_state.dart';

class LeadDetailBloc extends Bloc<LeadDetailEvent, LeadDetailState> {
  LeadDetailBloc() : super(LeadDetailLoaded());

  @override
  Stream<LeadDetailState> mapEventToState(
    LeadDetailEvent event,
  ) async* {
    if (event is LeadDetailStart) {
      yield* _start();
    }
  }

  /// The function that handles the startup of the lead detail screen
  Stream<LeadDetailState> _start() async* {
    try {
      yield LeadDetailLoaded();
    } catch (error, stackTrace) {
      yield LeadDetailError(
        error: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
