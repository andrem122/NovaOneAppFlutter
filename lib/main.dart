import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:novaone/screens/screens.dart';
import 'localizations.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (BuildContext context) => App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: NovaOneLocalizations.appName,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: NavScreen(),
    );
  }
}
