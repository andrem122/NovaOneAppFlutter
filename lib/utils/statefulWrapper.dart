import 'package:flutter/material.dart';

/// A wrapper class for widgets of type StatelessWidget so that we can run some initilization code if we need to
///
/// [onInit] must be provided and a [child] widget. [onInit] allows us to run whatever code we want when the
/// stateless widget is initialized.
class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const StatefulWrapper({Key key, @required this.onInit, @required this.child})
      : assert(onInit != null),
        assert(child != null),
        super(key: key);
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
