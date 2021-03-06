import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/screens/input/inputLayout.dart';
import 'package:novaone/screens/settings/bloc/settings_bloc.dart';
import 'package:novaone/testData.dart';
import 'package:novaone/widgets/widgets.dart';

class SettingsMobilePortrait extends StatelessWidget {
  final User user;

  const SettingsMobilePortrait({Key? key, required this.user})
      : super(key: key);

  Widget _createPopUpMenuOptions(
      {required BuildContext context, required InputLayout editScreen}) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return settingsPopupMenuOptions;
      },
      icon: Icon(Icons.more_vert),
      onSelected: (dynamic listTableItemMenuOptions) {
        if (listTableItemMenuOptions == ListTableItemMenuOptions.Edit) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => editScreen));
        } else if (listTableItemMenuOptions == ListTableItemMenuOptions.Copy) {
          // TODO: Action for copying text
          print('Copy Settings Item Text');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // The table items for the account section
    final List<Widget> accountChildren = [
      _SettingsTableItem(
        title: user.fullName,
        subtitle: 'Full Name',
        trailingWidget: _createPopUpMenuOptions(
          context: context,
          editScreen: InputLayout(
              title: 'Edit Full Name',
              description: 'Type in your new full name.',
              hintText: 'Type in your name.',
              inputWidgetType: InputWidgetType.TextInput),
        ),
        onTap: () {},
      ),
      _SettingsTableItem(
        title: '${user.userId}',
        subtitle: 'Customer Number',
        onTap: () {},
      ),
      _SettingsTableItem(
        title: 'Password',
        subtitle: 'Update your current password',
        trailingWidget: Icon(Icons.arrow_forward_ios_sharp),
        onTap: () {},
      ),
      _SettingsTableItem(
        title: 'Sign Out',
        subtitle: 'Sign out of your account',
        trailingWidget: Icon(Icons.arrow_forward_ios_sharp),
        onTap: () =>
            BlocProvider.of<SettingsBloc>(context).add(SettingsSignOutTapped()),
        isLastItem: true,
      ),
    ];

    // The table items for the contact section
    final List<Widget> contactChildren = [
      _SettingsTableItem(
        onTap: () {},
        subtitle: user.phoneNumber,
        title: 'Phone Number',
        isFirstItem: true,
      ),
      _SettingsTableItem(
        onTap: () {},
        subtitle: user.email,
        title: 'Email',
        isLastItem: true,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          NovaOneAppBar(
            title: 'Settings',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: _SettingsTableSection(
                      sectionTitle: 'Account',
                      children: accountChildren,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: _SettingsTableSection(
                      sectionTitle: 'Contact',
                      children: contactChildren,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: _SettingsTableSection(
                      sectionTitle: 'Notifications',
                      children: accountChildren,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A section of the settings table
///
/// Takes in a required [sectionTitle] for each section
/// and some [children] to fill up the section of the table
class _SettingsTableSection extends StatelessWidget {
  const _SettingsTableSection({
    Key? key,
    required this.sectionTitle,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: spaceBetweenSettingsItems,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding, bottom: defaultPadding),
            child: Text(
              sectionTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Palette.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]..addAll(children),
      ),
    );
  }
}

/// A table item that goes into a table section
///
/// [isLastItem] will give the InkWell a rounded border for the bottom left and bottom right border radii
/// [isFirstItem] will give the InkWell a rounded border for the top left and top right border radii
class _SettingsTableItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailingWidget;
  final Function() onTap;
  final bool isLastItem;
  final bool isFirstItem;

  const _SettingsTableItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.trailingWidget,
      required this.onTap,
      this.isLastItem = false,
      this.isFirstItem = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius? itemBorderRadius;
    if (isFirstItem) {
      itemBorderRadius = BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius));
    } else if (isLastItem) {
      itemBorderRadius = BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius));
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: itemBorderRadius,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
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
            ),
            trailingWidget != null ? trailingWidget! : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
