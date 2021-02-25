import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final InputWidgetType inputWidget;

  const InputWidget({Key key, this.hintText, @required this.inputWidget})
      : assert(inputWidget != null),
        super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  CalendarController _calendarController;
  Widget _updateWidget;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();

    if (widget.inputWidget == InputWidgetType.CalendarInput) {
      _updateWidget = RoundedContainer(
        child: TableCalendar(
          calendarController: _calendarController,
        ),
        constraints: BoxConstraints(maxWidth: maxContainerWidth),
        width: double.infinity,
      );
    } else if (widget.inputWidget == InputWidgetType.TextInput) {
      _updateWidget = NovaOneTextInput();
    } else {
      _updateWidget = NovaOneBinaryInput(
        onPressedNo: () {},
        onPressedYes: () {},
      );
    }
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _updateWidget;
  }
}
