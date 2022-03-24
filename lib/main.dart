import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/screens/active_ticket.dart';

import 'package:smart_queue_management_system_app/screens/notification_screen.dart';
import 'package:smart_queue_management_system_app/screens/queue_join_confirmation.dart';

import 'package:smart_queue_management_system_app/screens/ui_screens/homescreen.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/login_screen.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/registration_screen.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/dashboard_screen.dart';
import 'package:smart_queue_management_system_app/screens/ui_screens/queue_details_screen.dart';
import 'package:smart_queue_management_system_app/services/positions.dart';

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
<<<<<<< HEAD
      initialRoute: Positions.id,
=======
      initialRoute: WelcomeScreen.id,
>>>>>>> 85033a10ca07e16a80a77cd2bd0701b8f8aefbb1
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        DashboardScreen.id: (context) => const DashboardScreen(),
        NotificationScreen.id: (context) => const NotificationScreen(),
        QueueDetails.id: (context) => const QueueDetails(),
<<<<<<< HEAD
        HomeScreen.id: (context) => const HomeScreen(),
        Positions.id: (context) => const Positions(),
=======
        HomeScreen.id: ((context) => const HomeScreen()),
        QueueJoined.id: ((context) => const QueueJoined(
            token_no: 57, current_token: 54, average_time: 10)),
        ActiveTicket.id: (context) => const ActiveTicket(),
>>>>>>> 85033a10ca07e16a80a77cd2bd0701b8f8aefbb1
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
