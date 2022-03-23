import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/screens/login_screen.dart';
import 'package:smart_queue_management_system_app/screens/registration_screen.dart';
import 'package:smart_queue_management_system_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_queue_management_system_app/screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QEasy',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        DashboardScreen.id: (context) => const DashboardScreen(),
      },
      // initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => const WelcomeScreen(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/SecondPage': (context) => const LoginScreen(),
      // },
      // home: WelcomeScreen(),
    );
  }
}
