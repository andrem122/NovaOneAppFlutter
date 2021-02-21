import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/widgets/widgets.dart';

class NovaOneListObjectsMobilePortrait extends StatelessWidget {
  final List<NovaOneListTableItemData> tableItems;

  const NovaOneListObjectsMobilePortrait({Key key, this.tableItems})
      : assert(tableItems != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NovaOneTable(
        tableItems: tableItems,
        tableType: NovaOneTableTypes.ListTable,
        scrollable: true,
      ),
    );
  }
}
