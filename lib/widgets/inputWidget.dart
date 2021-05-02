import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

/// Returns the input widget based on which [inputWidgetType] is given
class InputWidget extends StatefulWidget {
  final String? hintText;
  final InputWidgetType inputWidgeType;

  const InputWidget({Key? key, this.hintText, required this.inputWidgeType})
      : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late Widget _updateWidget;

  @override
  void initState() {
    super.initState();
    final now = new DateTime.now();
    switch (widget.inputWidgeType) {
      case InputWidgetType.CalendarInput:
        _updateWidget = RoundedContainer(
          child: TableCalendar(
            firstDay: DateTime(now.year - 2, now.month, now.day),
            focusedDay: now,
            lastDay: DateTime(now.year + 5, now.month, now.day),
          ),
          constraints: BoxConstraints(maxWidth: maxContainerWidth),
          width: double.infinity,
        );

        break;
      case InputWidgetType.TextInput:
        _updateWidget = NovaOneTextInput(
          hintText: widget.hintText!,
          autoFocus: true,
        );
        break;
      case InputWidgetType.EmailInput:
        _updateWidget = NovaOneTextInput(
          hintText: widget.hintText!,
          keyboardType: TextInputType.emailAddress,
          autoFocus: true,
        );
        break;
      case InputWidgetType.BinaryInput:
        _updateWidget = NovaOneBinaryInput(
          onPressedNo: () {},
          onPressedYes: () {},
        );
        break;
      case InputWidgetType.ListInput:
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _updateWidget;
  }
}
