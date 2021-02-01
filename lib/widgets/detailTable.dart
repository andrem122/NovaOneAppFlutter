import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';

class DetailTable extends StatelessWidget {
  final List<DetailTableItem> detailTableItems;

  const DetailTable({Key key, this.detailTableItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemCount: detailTableItems.length,
          itemBuilder: (BuildContext context, int index) {
            // Make sure to add no bottom border for the last item in the list
            final bool isLastItem =
                index == detailTableItems.length - 1 ? true : false;
            final DetailTableItem detailTableItem = detailTableItems[index];
            return _DetailTableItem(
                detailTableItem: detailTableItem,
                isLastItem: isLastItem,
                onTap: () => print('Test'));
          }),
    );
  }
}

class _DetailTableItem extends StatelessWidget {
  final DetailTableItem detailTableItem;
  final bool isLastItem;
  final Function() onTap;

  const _DetailTableItem({
    Key key,
    this.isLastItem = false,
    @required this.onTap,
    @required this.detailTableItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
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
                    Icon(detailTableItem.iconData),
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
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    size: 18,
                    color: Colors.black,
                  ),
                  onPressed: onTap),
            ],
          ),
        ),
      ),
    );
  }
}
