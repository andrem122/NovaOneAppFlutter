import 'package:flutter/widgets.dart';

/// Allows a transition to another screen/page by sliding from the bottom up
class SlideUpRoute extends PageRouteBuilder {
  final Widget page;

  SlideUpRoute({required this.page})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                page,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ));
}
