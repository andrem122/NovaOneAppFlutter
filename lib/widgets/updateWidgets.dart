import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class UpdateWidget extends StatefulWidget {
  final String? hintText;
  final UpdateWidgetType updateWidget;

  const UpdateWidget({Key? key, this.hintText, required this.updateWidget})
      : super(key: key);

  @override
  _UpdateWidgetState createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  late Widget _updateWidget;

  @override
  void initState() {
    super.initState();
    final now = new DateTime.now();
    if (widget.updateWidget == UpdateWidgetType.CalendarField) {
      _updateWidget = RoundedContainer(
        child: TableCalendar(
          firstDay: DateTime(now.year - 2, now.month, now.day),
          focusedDay: now,
          lastDay: DateTime(now.year + 5, now.month, now.day),
        ),
        constraints: BoxConstraints(maxWidth: maxContainerWidth),
        width: double.infinity,
      );
    } else if (widget.updateWidget == UpdateWidgetType.TextField) {
      _updateWidget = RoundedContainer(
          constraints: BoxConstraints(maxWidth: maxContainerWidth),
          width: double.infinity,
          child: TextField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: widget.hintText),
          ));
    } else {
      _updateWidget = BinaryUpdateWidget();
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

class BinaryUpdateWidget extends StatelessWidget {
  final List<Widget> mobileChildren = [
    NovaOneButton(
      color: Palette.primaryColor,
      constraints: const BoxConstraints(
          minWidth: minButtonWidth, minHeight: minButtonHeight, maxWidth: 200),
      onPressed: () => print('Update local store and database'),
      title: 'Yes',
    ),
    const SizedBox(
      height: 20,
    ),
    NovaOneButton(
      color: Palette.secondaryColor,
      constraints: const BoxConstraints(
          minWidth: minButtonWidth, minHeight: minButtonHeight, maxWidth: 200),
      onPressed: () => print('Update local store and database'),
      title: 'No',
    ),
  ];

  final List<Widget> tabletChildren = [
    NovaOneButton(
      color: Palette.primaryColor,
      constraints: const BoxConstraints(
          minWidth: minButtonWidth, minHeight: minButtonHeight, maxWidth: 250),
      onPressed: () => print('Update local store and database'),
      title: 'Yes',
    ),
    const SizedBox(
      width: 60,
    ),
    NovaOneButton(
      color: Palette.secondaryColor,
      constraints: const BoxConstraints(
          minWidth: minButtonWidth, minHeight: minButtonHeight, maxWidth: 250),
      onPressed: () => print('Update local store and database'),
      title: 'No',
    ),
  ];

  final List<Widget> desktopChildren = [
    NovaOneButton(
      color: Palette.primaryColor,
      constraints: const BoxConstraints(
          minWidth: minButtonWidth, minHeight: minButtonHeight, maxWidth: 250),
      onPressed: () => print('Update local store and database'),
      title: 'Yes',
    ),
    const SizedBox(
      width: 60,
    ),
    NovaOneButton(
      color: Palette.secondaryColor,
      constraints: const BoxConstraints(
          minWidth: minButtonWidth, minHeight: minButtonHeight, maxWidth: 250),
      onPressed: () => print('Update local store and database'),
      title: 'No',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: mobileChildren,
        ),
        landscape: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: mobileChildren,
        ),
      ),
      tablet: MaxWidthContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tabletChildren,
        ),
      ),
      desktop: MaxWidthContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: desktopChildren,
        ),
      ),
    );
  }
}
