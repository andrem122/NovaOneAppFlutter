import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/leadDetail/bloc/lead_detail_bloc.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/widgets/widgets.dart';

class LeadDetailLayout extends StatelessWidget {
  final Lead lead;
  final Color leadColor;
  final List<NovaOneDetailTableItemData> detailTableItems;

  const LeadDetailLayout(
      {Key? key,
      required this.lead,
      required this.leadColor,
      required this.detailTableItems})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          LeadDetailBloc()..add(LeadDetailStart()),
      child: BlocConsumer<LeadDetailBloc, LeadDetailState>(
        builder: (BuildContext context, LeadDetailState state) {
          if (state is LeadDetailError) {
            _buildError(context: context);
          }

          return _buildLoaded(context: context);
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }

  Widget _buildError({required BuildContext context}) {
    return ErrorDisplay();
  }

  Widget _buildLoaded({required BuildContext context}) {
    return ScreenTypeLayout(
        mobile: OrientationLayout(
      portrait: LeadDetailMobilePortrait(
          lead: lead, leadColor: leadColor, tableItems: detailTableItems),
    ));
  }
}
