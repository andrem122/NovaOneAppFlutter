import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/widgets/widgets.dart';

class NovaOneListObjectsMobilePortrait extends StatelessWidget {
  final List<NovaOneTableItem> tableItems;

  const NovaOneListObjectsMobilePortrait({Key key, this.tableItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NovaOneTable(
        tableItems: tableItems,
      ),
    );
  }
}
