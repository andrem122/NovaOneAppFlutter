import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/widgets/widgets.dart';

class LoginDesktopPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Sign in to continue!',
              style: Theme.of(context).textTheme.headline3.copyWith(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            const SizedBox(
              height: 40,
            ),
            Image(
              image: AssetImage(imagesPath + logoImage),
              width: 160,
              height: 160,
            ),
            SizedBox(
              height: 60,
            ),
            NovaOneTextInput(
              scaleTextSize: 1.4,
              constraints: BoxConstraints(maxWidth: maxContainerWidth + 200),
              border: Border.all(color: Colors.grey[300], width: 2),
              keyboardType: TextInputType.emailAddress,
              autoFocus: true,
              hintText: 'Your Email',
              labelText: 'Email Address',
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 15,
            ),
            NovaOneTextInput(
              scaleTextSize: 1.4,
              constraints: BoxConstraints(maxWidth: maxContainerWidth + 200),
              border: Border.all(color: Colors.grey[300], width: 2),
              keyboardType: TextInputType.emailAddress,
              hintText: 'Your Password',
              labelText: 'Password',
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Forgot your password?',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            NovaOneButton(
              scaleTextSize: 1.4,
              constraints: const BoxConstraints(
                  minWidth: minButtonWidth,
                  minHeight: minButtonHeight,
                  maxWidth: maxButtonWidth + 200),
              onPressed: () => print('Login'),
              title: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}

class LoginDesktopLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Text('Login Screen')),
      ],
    );
  }
}
