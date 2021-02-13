import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class UpdateWidget extends StatefulWidget {
  final String hintText;
  final UpdateWidgetType updateWidget;

  const UpdateWidget({Key key, this.hintText, @required this.updateWidget})
      : super(key: key);

  @override
  _UpdateWidgetState createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        RoundedContainer(
          constraints: BoxConstraints(maxWidth: maxContainerWidth),
          width: double.infinity,
          child: widget.updateWidget == UpdateWidgetType.TextField
              ? TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: widget.hintText),
                )
              : TableCalendar(
                  calendarController: _calendarController,
                ),
        ),
      ],
    );
  }
}
