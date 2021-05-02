import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';

class NovaOneLoadingIndicator extends StatelessWidget {
  final String? title;

  const NovaOneLoadingIndicator({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(containerBorderRadius)),
      width: 100.0,
      height: 100.0,
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              const SizedBox(
                height: 10,
              ),
              Text(
                title ?? '',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ))),
    );
  }
}
