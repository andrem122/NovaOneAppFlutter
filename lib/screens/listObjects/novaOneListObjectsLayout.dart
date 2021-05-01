import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/screens.dart';

class NovaOneListObjectsLayout extends StatelessWidget {
  final List<NovaOneListTableItemData> tableItems;
  final String title;
  final String addListObjectDescription;
  final String heroTag;
  final bool showBackButton;

  const NovaOneListObjectsLayout(
      {Key key,
      @required this.tableItems,
      @required this.title,
      @required this.addListObjectDescription,
      this.heroTag,
      this.showBackButton = false})
      : assert(tableItems != null),
        assert(title != null),
        assert(addListObjectDescription != null),
        assert(heroTag != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: heroTag,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => InputLayout(
                    description: addListObjectDescription,
                    inputWidgetType: InputWidgetType.TextInput,
                    hintText: 'Full Name',
                    title: 'Full Name',
                    backIcon: Icons.close,
                  )));
        },
        child: Icon(Icons.add),
        backgroundColor: Palette.primaryColor,
      ),
      body: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: NovaOneListObjectsMobilePortrait(
            tableItems: tableItems,
            title: title,
            showBackButton: showBackButton,
          ),
        ),
      ),
    );
  }
}
