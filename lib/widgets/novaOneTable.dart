import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/screens/screens.dart';
import '../constants.dart';

class NovaOneTable extends StatefulWidget {
  final List<NovaOneTableItemData> tableItems;
  final NovaOneTableTypes tableType;
  final bool scrollable;

  NovaOneTable(
      {Key key,
      @required this.tableItems,
      @required this.tableType,
      this.scrollable = false})
      : assert(tableItems != null),
        assert(tableType != null),
        super(key: key);

  @override
  _NovaOneTableState createState() => _NovaOneTableState();
}

class _NovaOneTableState extends State<NovaOneTable> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: widget.scrollable == false
            ? NeverScrollableScrollPhysics()
            : AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.tableItems.length,
        itemBuilder: (BuildContext context, int index) {
          // Make sure to add no bottom border for the last item in the list
          final bool isLastItem =
              index == widget.tableItems.length - 1 ? true : false;
          final bool isFirstItem = index == 0 ? true : false;

          Widget tableItemWidget = Container();
          switch (widget.tableType) {
            case NovaOneTableTypes.DetailTable:
              final NovaOneDetailTableItemData tableItem =
                  widget.tableItems[index];

              tableItemWidget = _NovaOneDetailTableItem(
                detailTableItem: tableItem,
                isLastItem: isLastItem,
                isFirstItem: isFirstItem,
                popupMenuOptions: tableItem.popupMenuOptions,
                onTap: () => print('Test'),
                onPopupMenuItemSelected: (leadDetailMenuOptions) {
                  if (leadDetailMenuOptions == LeadDetailMenuOptions.Edit) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => EditScreenLayout(
                              updateWidget: tableItem.updateWidget,
                              title: tableItem.updateTitle,
                              description: tableItem.updateDescription,
                              hintText: tableItem.updateFieldHintText,
                            )));
                  } else {
                    print('Copying text from cell');
                  }
                },
              );
              break;
            case NovaOneTableTypes.ListTable:
              final NovaOneListTableItemData tableItem =
                  widget.tableItems[index];

              tableItemWidget = _NovaOneListTableItem(
                isFirstItem: isFirstItem,
                isLastItem: isLastItem,
                listTableItem: tableItem,
                onTap: () {},
                onPopupMenuItemSelected: (listTableItemMenuOptions) {
                  if (listTableItemMenuOptions ==
                      ListTableItemMenuOptions.Call) {}
                },
              );
              break;
          }

          return tableItemWidget;
        });
  }
}

/// Shows the details of an object's properties in a table item
class _NovaOneDetailTableItem extends StatelessWidget {
  final NovaOneDetailTableItemData detailTableItem;
  final bool isLastItem;
  final bool isFirstItem;
  final List<PopupMenuEntry> popupMenuOptions;
  final Function(dynamic) onPopupMenuItemSelected;
  final Function() onTap;

  const _NovaOneDetailTableItem({
    Key key,
    this.isLastItem = false,
    this.isFirstItem = false,
    @required this.onTap,
    @required this.detailTableItem,
    @required this.popupMenuOptions,
    @required this.onPopupMenuItemSelected,
  })  : assert(popupMenuOptions != null),
        assert(onTap != null),
        assert(detailTableItem != null),
        assert(onPopupMenuItemSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the border radius for the last and first items to be rounded corners
    BorderRadius borderRadius;
    if (isFirstItem) {
      // Top right and top left for the first item in the list
      borderRadius = BorderRadius.only(
          topRight: Radius.circular(containerBorderRadius),
          topLeft: Radius.circular(containerBorderRadius));
    } else if (isLastItem) {
      borderRadius = BorderRadius.only(
          bottomRight: Radius.circular(containerBorderRadius),
          bottomLeft: Radius.circular(containerBorderRadius));
    } else {
      borderRadius = BorderRadius.zero;
    }

    return Material(
      color: Colors.white,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
            border: Border(
              bottom: isLastItem == false
                  ? BorderSide(width: 2, color: Colors.grey[200])
                  : BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      detailTableItem.iconData,
                      color: detailTableItem.iconColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            detailTableItem.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            detailTableItem.subtitle,
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return popupMenuOptions;
                },
                icon: Icon(Icons.more_vert),
                onSelected: onPopupMenuItemSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Lists the basic properties of the object in a table item
class _NovaOneListTableItem extends StatelessWidget {
  final NovaOneListTableItemData listTableItem;
  final bool isLastItem;
  final bool isFirstItem;
  final Color color;
  final Function(dynamic) onPopupMenuItemSelected;
  final Function() onTap;

  const _NovaOneListTableItem({
    Key key,
    @required this.listTableItem,
    this.isLastItem = false,
    @required this.onTap,
    this.color = Palette.primaryColor,
    this.isFirstItem = false,
    @required this.onPopupMenuItemSelected,
  })  : assert(listTableItem != null),
        assert(onPopupMenuItemSelected != null),
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the border radius for the last and first items to be rounded corners
    BorderRadius borderRadius;
    if (isFirstItem) {
      // Top right and top left for the first item in the list
      borderRadius = BorderRadius.only(
          topRight: Radius.circular(containerBorderRadius),
          topLeft: Radius.circular(containerBorderRadius));
    } else if (isLastItem) {
      borderRadius = BorderRadius.only(
          bottomRight: Radius.circular(containerBorderRadius),
          bottomLeft: Radius.circular(containerBorderRadius));
    } else {
      borderRadius = BorderRadius.zero;
    }

    return Material(
      borderRadius: borderRadius,
      color: Colors.white,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: isLastItem == false
                  ? BorderSide(width: 2, color: Colors.grey[200])
                  : BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      child: Text(listTableItem.title[0]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          listTableItem.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          listTableItem.subtitle,
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return listTableItem.popupMenuOptions;
                },
                icon: Icon(Icons.more_vert),
                onSelected: onPopupMenuItemSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
