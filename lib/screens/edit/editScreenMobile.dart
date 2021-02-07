import 'package:flutter/material.dart';
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
    final FocusNode foucusNode = FocusNode();
    foucusNode.requestFocus();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: GradientHeader(
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
          ),
          SliverPadding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              sliver: SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  top: false,
                  child: Column(
                    children: [
                      RoundedContainer(
                        width: double.infinity,
                        child: Column(
                          children: [
                            TextField(
                              onEditingComplete: () => foucusNode.unfocus(),
                              focusNode: foucusNode,
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: hintText),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      NovaOneButton(
                        onPressed: () => print(
                          'Submit value to api and update in local store',
                        ),
                        title: 'Update',
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
