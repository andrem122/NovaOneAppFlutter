import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/testData.dart';
import 'package:novaone/widgets/widgets.dart';

class SettingsMobilePortrait extends StatelessWidget {
  final User user;

  const SettingsMobilePortrait({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NovaOneAppBar(
            title: 'Settings',
          ),
          const SizedBox(
            height: spaceBetweenSettingsItems,
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Palette.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: spaceBetweenSettingsItems,
                ),
                _SettingsTableItem(
                  title: user.fullName,
                  subtitle: 'Full Name',
                  trailingWidget: PopupMenuButton(
                    itemBuilder: (context) {
                      return settingsPopupMenuOptions;
                    },
                    icon: Icon(Icons.more_vert),
                    onSelected: (listTableItemMenuOptions) {
                      if (listTableItemMenuOptions ==
                          ListTableItemMenuOptions.Edit) {
                        // TODO: Action for editing
                        print('Edit Settings Item');
                      } else if (listTableItemMenuOptions ==
                          ListTableItemMenuOptions.Copy) {
                        // TODO: Action for copying text
                        print('Copy Settings Item Text');
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: spaceBetweenSettingsItems,
                ),
                _SettingsTableItem(
                  title: '${user.userId}',
                  subtitle: 'Customer Number',
                ),
                const SizedBox(
                  height: spaceBetweenSettingsItems,
                ),
                _SettingsTableItem(
                  title: 'Password',
                  subtitle: 'Update your current password',
                  trailingWidget: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTableItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailingWidget;

  const _SettingsTableItem(
      {Key key,
      @required this.title,
      @required this.subtitle,
      this.trailingWidget})
      : assert(title != null),
        assert(subtitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 6,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        trailingWidget != null ? trailingWidget : SizedBox.shrink(),
      ],
    );
  }
}
