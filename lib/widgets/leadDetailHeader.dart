import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/widgets/widgets.dart';

import '../constants.dart';
import '../palette.dart';

class LeadDetailHeader extends StatelessWidget {
  final double containerDecimalHeight;
  final Lead? lead;
  final Color leadColor; // The color that was used in the recent leads table

  const LeadDetailHeader(
      {Key? key,
      required this.containerDecimalHeight,
      required this.lead,
      required this.leadColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GradientHeader(
          alignment: Alignment.topLeft,
          containerDecimalHeight: 0.25,
        ),
        Positioned.fill(
          bottom: -80,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  constraints: BoxConstraints(minWidth: 280, maxWidth: 500),
                  height: 147,
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          lead!.name,
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
                              width: 10,
                            ),
                            CircleButton(
                              iconData: Icons.email,
                              onPressed: () => print('Calling lead'),
                              backgroundColor: Palette.primaryColor,
                              iconColor: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(containerBorderRadius)),
                ),
                Positioned.fill(
                    top: -20,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Center(
                          child: Text(
                            lead!.name[0],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50),
                          ),
                        ),
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                            color: leadColor,
                            borderRadius:
                                BorderRadius.circular(containerBorderRadius)),
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
