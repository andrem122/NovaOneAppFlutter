import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:novaone/api/userApiClient.dart';
import 'package:novaone/auth/auth.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/screens/screens.dart';
import 'localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

void main() {
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
          create: (BuildContext context) => SharedPreferences.getInstance()),
      RepositoryProvider(
          create: (BuildContext context) =>
              UserStore(storage: FlutterSecureStorage())),
      RepositoryProvider(
          create: (BuildContext context) => UserApiClient(client: Client()))
    ],
    child:
        DevicePreview(enabled: false, builder: (BuildContext context) => App()),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        primaryColor: Palette.primaryColor,
      ),
      home: LoginScreenLayout(),
    );
  }
}
