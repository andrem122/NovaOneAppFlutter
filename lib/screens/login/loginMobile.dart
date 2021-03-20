import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/screens/login/bloc/login_bloc.dart';
import 'package:novaone/widgets/widgets.dart';

class LoginMobilePortrait extends StatelessWidget {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
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
                  fontSize: 32,
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
                  fontSize: 24),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            NovaOneTextInput(
              controller: emailController,
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
              controller: passwordController,
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
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            NovaOneButton(
              onPressed: () => BlocProvider.of<LoginBloc>(context).add(
                  LoginButtonTapped(
                      email: emailController.text,
                      password: passwordController.text)),
              title: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}

class LoginMobileLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Text('Login Screen')),
      ],
    );
  }
}
