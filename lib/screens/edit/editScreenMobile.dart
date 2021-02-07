import 'package:flutter/material.dart';
import 'package:novaone/widgets/widgets.dart';

class EditScreenMobilePortrait extends StatelessWidget {
  final String title;
  final String description;

  const EditScreenMobilePortrait(
      {Key key, @required this.title, @required this.description})
      : assert(title != null),
        assert(description != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: GradientHeader(
            containerDecimalHeight: 0.20,
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  IconButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
