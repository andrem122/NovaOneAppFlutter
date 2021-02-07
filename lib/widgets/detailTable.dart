import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/screens/screens.dart';
import '../constants.dart';

class DetailTable extends StatefulWidget {
  final List<DetailTableItem> detailTableItems;

  const DetailTable({Key key, this.detailTableItems}) : super(key: key);

  @override
  _DetailTableState createState() => _DetailTableState();
}

class _DetailTableState extends State<DetailTable> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.detailTableItems.length,
        itemBuilder: (BuildContext context, int index) {
          // Make sure to add no bottom border for the last item in the list
          final bool isLastItem =
              index == widget.detailTableItems.length - 1 ? true : false;
          final bool isFirstItem = index == 0 ? true : false;
          final DetailTableItem detailTableItem =
              widget.detailTableItems[index];

          return _DetailTableItem(
            detailTableItem: detailTableItem,
            isLastItem: isLastItem,
            isFirstItem: isFirstItem,
            popupMenuOptions: detailTableItem.popupMenuOptions,
            onTap: () => print('Test'),
            onPopupMenuItemSelected: (value) {
              if (value == LeadDetailMenuOptions.Edit) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => EditScreenLayout(
                          title: detailTableItem.updateTitle,
                          description: detailTableItem.updateDescription,
                          hintText: detailTableItem.updateFieldHintText,
                        )));
              } else {
                print('Copying text from cell');
              }
            },
          );
        });
  }
}

class _DetailTableItem extends StatelessWidget {
  final DetailTableItem detailTableItem;
  final bool isLastItem;
  final bool isFirstItem;
  final List<PopupMenuEntry> popupMenuOptions;
  final Function(dynamic) onPopupMenuItemSelected;
  final Function() onTap;

  const _DetailTableItem({
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
