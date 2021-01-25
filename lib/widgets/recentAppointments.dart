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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemCount: appointments.length,
          itemBuilder: (BuildContext context, int index) {
            // Make sure to add no bottom border for the last item in the list
            final bool isLastItem =
                index == appointments.length - 1 ? true : false;
            return _RecentAppointmentItem(
              appointment: appointments[index],
              isLastItem: isLastItem,
              onTap: () => print('Go to appointment detail screen'),
            );
          }),
    );
  }
}

class _RecentAppointmentItem extends StatelessWidget {
  final Appointment appointment;
  final bool isLastItem;
  final Function() onTap;

  const _RecentAppointmentItem({
    Key key,
    @required this.appointment,
    this.isLastItem = false,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _random = new Random();

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
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
                      backgroundColor: Palette
                          .appColors[_random.nextInt(Palette.appColors.length)],
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
