import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/pageRoutes/pageRoute.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/screens/screens.dart';
import 'package:novaone/widgets/widgets.dart';

class NovaOneListObjectsMobilePortrait extends StatelessWidget {
  final List<NovaOneListTableItemData> tableItems;

  const NovaOneListObjectsMobilePortrait({Key key, this.tableItems})
      : assert(tableItems != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(SlideUpRoute(
                page: InputLayout(
              description:
                  'Add the name of the person you have an appointment with.',
              inputWidgetType: InputWidgetType.TextInput,
              hintText: 'Full Name',
              title: 'Full Name',
              backIcon: Icons.close,
            )));
          },
          child: Icon(Icons.add),
          backgroundColor: Palette.primaryColor,
        ),
        body: Column(children: [
          Container(
            height: size.width > 320 ? size.height * 0.25 : size.height * 0.26,
            child: Stack(
              children: [
                GradientHeader(
                  containerDecimalHeight: size.width > 320 ? 0.20 : 0.17,
                  child: SafeArea(
                      child: Center(
                          child: Text(
                    'Appointments',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ))),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: RoundedContainer(
                      height: 54,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 50,
                            offset: Offset(0, 10),
                            color: Palette.primaryColor.withOpacity(0.23))
                      ],
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  defaultPadding, 40, defaultPadding, 5),
              child: NovaOneTable(
                tableItems: tableItems,
                tableType: NovaOneTableTypes.ListTable,
                scrollable: true,
              ),
            ),
          ),
        ]));
  }
}
