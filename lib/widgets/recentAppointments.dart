import 'dart:math';

import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';

import '../palette.dart';

class RecentAppointments extends StatelessWidget {
  final List<Appointment> appointments;

  const RecentAppointments({
    Key key,
    @required this.appointments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: appointments.length,
        itemBuilder: (BuildContext context, int index) {
          // Make sure to add no bottom border for the last item in the list
          // Make sure to add no bottom border for the last item in the list
          final bool isLastItem =
              index == appointments.length - 1 ? true : false;
          final bool isFirstItem = index == 0 ? true : false;
          final _random = new Random();
          final Color appointmentColor =
              Palette.appColors[_random.nextInt(Palette.appColors.length)];

          return _RecentAppointmentItem(
            appointmentColor: appointmentColor,
            appointment: appointments[index],
            isLastItem: isLastItem,
            isFirstItem: isFirstItem,
            onTap: () => print('Go to appointment detail screen'),
          );
        });
  }
}

class _RecentAppointmentItem extends StatelessWidget {
  final Appointment appointment;
  final bool isLastItem;
  final bool isFirstItem;
  final Color appointmentColor;
  final Function() onTap;

  const _RecentAppointmentItem({
    Key key,
    @required this.appointment,
    this.isLastItem = false,
    @required this.onTap,
    this.isFirstItem = false,
    @required this.appointmentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the border radius for the last and first items to be rounded corners
    BorderRadius borderRadius;
    if (isFirstItem) {
      // Top right and top left for the first item in the list
      borderRadius = BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15));
    } else if (isLastItem) {
      borderRadius = BorderRadius.only(
          bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15));
    } else {
      borderRadius = BorderRadius.zero;
    }

    return Material(
      color: Colors.white,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 80,
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
                      backgroundColor: appointmentColor,
                      foregroundColor: Colors.white,
                      child: Text(appointment.name[0]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          appointment.name,
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
