import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/widgets/widgets.dart';

import '../constants.dart';
import '../palette.dart';

class LeadDetailHeader extends StatelessWidget {
  final double containerDecimalHeight;
  final Lead lead;

  const LeadDetailHeader(
      {Key key, @required this.containerDecimalHeight, @required this.lead})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            gradient: Palette.greetingContainerGradient,
          ),
          height: MediaQuery.of(context).size.height *
              containerDecimalHeight, // 30% percent height of the device
        ),
        Positioned.fill(
          bottom: -80,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  width: 280,
                  height: 140,
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          lead.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 27),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Dec 25, 2020',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CircleButton(
                              iconData: Icons.phone,
                              onPressed: () => print('Calling lead'),
                              backgroundColor: Palette.primaryColor,
                              iconColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CircleButton(
                              iconData: Icons.email,
                              onPressed: () => print('Calling lead'),
                              backgroundColor: Palette.primaryColor,
                              iconColor: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius)),
                ),
                Positioned.fill(
                    top: -20,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(borderRadius)),
                      ),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
