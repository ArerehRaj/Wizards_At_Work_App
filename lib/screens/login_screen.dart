import 'package:smart_queue_management_system_app/components/rounded_buttons.dart';
import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                height: 300,
                child: Image.asset('images/Q-easy.png'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              onChanged: (value) {},
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter you email'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextField(
              onChanged: (value) {},
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter you password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Log in',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
