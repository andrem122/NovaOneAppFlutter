import 'dart:math';

import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/screens/leadDetail/leadDetailLayout.dart';
import '../constants.dart';

class RecentLeads extends StatelessWidget {
  final List<Lead> leads;

  const RecentLeads({
    Key key,
    @required this.leads,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: leads.length,
        itemBuilder: (BuildContext context, int index) {
          // Make sure to add no bottom border for the last item in the list
          final bool isLastItem = index == leads.length - 1 ? true : false;
          final bool isFirstItem = index == 0 ? true : false;
          final _random = new Random();
          final Color leadColor =
              Palette.appColors[_random.nextInt(Palette.appColors.length)];
          final Lead lead = leads[index];

          return _RecentLeadItem(
            lead: lead,
            leadColor: leadColor,
            isLastItem: isLastItem,
            isFirstItem: isFirstItem,
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              final List<PopupMenuEntry> popupMenuOptions = [
                PopupMenuItem(
                  value: LeadDetailMenuOptions.Edit,
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: LeadDetailMenuOptions.Copy,
                  child: Text('Copy'),
                ),
              ];
              final List<DetailTableItem> detailTableItems = [
                DetailTableItem(
                  updateWidget: UpdateWidgetType.TextField,
                  title: lead.name,
                  subtitle: 'Name',
                  iconData: Icons.person,
                  iconColor: Palette.appColors[0],
                  popupMenuOptions: popupMenuOptions,
                  updateTitle: 'Update Name',
                  updateDescription: 'Update the name of the lead.',
                  updateFieldHintText: 'Name',
                ),
                DetailTableItem(
                  updateWidget: UpdateWidgetType.CalendarField,
                  title: lead.sentEmailDate,
                  subtitle: 'Email Sent',
                  iconData: Icons.send,
                  iconColor: Palette.appColors[1],
                  popupMenuOptions: popupMenuOptions,
                  updateTitle: 'Update Email',
                  updateDescription:
                      'Update the date the email was sent to the lead.',
                ),
                DetailTableItem(
                  updateWidget: UpdateWidgetType.CalendarField,
                  title: lead.sentTextDate,
                  subtitle: 'Text Sent',
                  iconData: Icons.textsms_rounded,
                  iconColor: Palette.appColors[2],
                  popupMenuOptions: popupMenuOptions,
                  updateTitle: 'Update Sent Text Date',
                  updateDescription:
                      'Update the date the text message was sent to the lead.',
                ),
                DetailTableItem(
                  updateWidget: UpdateWidgetType.TextField,
                  title: lead.phoneNumber,
                  subtitle: 'Phone Number',
                  iconData: Icons.phone,
                  iconColor: Palette.appColors[1],
                  popupMenuOptions: popupMenuOptions,
                  updateTitle: 'Update Phone',
                  updateDescription: 'Update the phone number of the lead.',
                  updateFieldHintText: 'Phone Number',
                ),
                DetailTableItem(
                  updateWidget: UpdateWidgetType.TextField,
                  title: lead.email,
                  subtitle: 'Email',
                  iconData: Icons.email,
                  iconColor: Palette.appColors[2],
                  popupMenuOptions: popupMenuOptions,
                  updateTitle: 'Update Email',
                  updateDescription: 'Update the email of the lead.',
                  updateFieldHintText: 'Email',
                ),
                DetailTableItem(
                  updateWidget: UpdateWidgetType.BinaryField,
                  title: lead.madeAppointment ? 'Yes' : 'No',
                  subtitle: 'Made Appointment',
                  iconData: Icons.calendar_today_rounded,
                  iconColor: Palette.appColors[3],
                  popupMenuOptions: popupMenuOptions,
                  updateTitle: 'Update Status',
                  updateDescription: 'Has the lead made an appointment?',
                ),
                DetailTableItem(
                  updateWidget: UpdateWidgetType.TextField,
                  title: lead.companyName,
                  subtitle: 'Company Name',
                  iconData: Icons.business,
                  iconColor: Palette.appColors[4],
                  popupMenuOptions: popupMenuOptions,
                  updateTitle: 'Update Company',
                  updateDescription: 'Update the company of the lead.',
                ),
              ];

              return LeadDetailLayout(
                lead: leads[index],
                leadColor: leadColor,
                detailTableItems: detailTableItems,
              );
            })),
          );
        });
  }
}

class _RecentLeadItem extends StatelessWidget {
  final Lead lead;
  final bool isLastItem;
  final bool isFirstItem;
  final Color leadColor;
  final Function() onTap;

  const _RecentLeadItem({
    Key key,
    @required this.lead,
    this.isLastItem = false,
    @required this.onTap,
    @required this.leadColor,
    this.isFirstItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the border radius for the last and first items to be rounded corners
    BorderRadius borderRadius;
    if (isFirstItem) {
      // Top right and top left for the first item in the list
      borderRadius = BorderRadius.only(
          topRight: Radius.circular(containerBorderRadius),
          topLeft: Radius.circular(containerBorderRadius));
    } else if (isLastItem) {
      borderRadius = BorderRadius.only(
          bottomRight: Radius.circular(containerBorderRadius),
          bottomLeft: Radius.circular(containerBorderRadius));
    } else {
      borderRadius = BorderRadius.zero;
    }

    return Material(
      borderRadius: borderRadius,
      color: Colors.white,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: isLastItem == false
                  ? BorderSide(width: 2, color: Colors.grey[200])
                  : BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: leadColor,
                      foregroundColor: Colors.white,
                      child: Text(lead.name[0]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          lead.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          'Dec 25',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 18,
                    color: Colors.black,
                  ),
                  onPressed: onTap),
            ],
          ),
        ),
      ),
    );
  }
}
