import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:novaone/constants.dart';

class EditScreenMobilePortrait extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;

  const EditScreenMobilePortrait(
      {Key key,
      @required this.title,
      @required this.description,
      this.hintText})
      : assert(title != null),
        assert(description != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // Show keyboard on widget load

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            GradientHeader(
              containerDecimalHeight: 0.30,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
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
                  ],
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                height: 0.60 * MediaQuery.of(context).size.height,
                child: UpdateWidget(hintText: hintText)),
          ],
        ),
      ),
    );
  }
}
