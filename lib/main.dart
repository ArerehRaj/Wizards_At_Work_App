import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/screens/active_ticket.dart';

import 'package:smart_queue_management_system_app/screens/notification_screen.dart';
import 'package:smart_queue_management_system_app/screens/queue_join_confirmation.dart';
import 'package:smart_queue_management_system_app/screens/queues_screen.dart';
//import 'package:smart_queue_management_system_app/screens/queue_details_screen.dart';

import 'package:smart_queue_management_system_app/screens/ui_screens/homescreen.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/login_screen.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/registration_screen.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/dashboard_screen.dart';
// import 'package:smart_queue_management_system_app/screens/ui_screens/queue_details_screen.dart';
import 'package:smart_queue_management_system_app/services/positions.dart';
//import 'package:smart_queue_management_system_app/screens/ui_screens/queue_details_screen.dart';

import './screens/queue_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   void _populateQueue() async {
    final avgWTList = [10,12,25,22,5,6];
    final arrayOfTokens = [
      ['1', '2', '3', '4'],
      ['1', '2', '3', '4', '5'],
      ['1', '2', '3'],
      ['1', '2', '3', '4', '5','6'],
      ['1','2'],
    ];
    final maxTokensList = [25, 20, 25, 25, 15];
    final queueDetailsList = [
      {'category':'doctor', 'name':'Dr Mayank'},
      {'category':'doctor', 'name':'Dr Patel'},
      {'category':'doctor', 'name':'Dr Raju'},
      {'category':'doctor', 'name':'Dr Chinmay'},
      {'category':'doctor', 'name':'Dr Rai'},
    ];
    final statusList = [true, false, true, true, false];
    final tokenDistributedList = [6,3,1,7,5];

      for(int i=0; i<avgWTList.length; i++){
      FirebaseFirestore.instance.collection('queue').add({
        'Avg_wait_time': avgWTList[i],
        'arr_tokens': arrayOfTokens[i],
        'max_tokens': maxTokensList[i],
        'queue_details': queueDetailsList[i],
        'status': statusList[i],
        'token_distributed': tokenDistributedList[i],
      }); 
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // _populateQueue();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QEasy',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        DashboardScreen.id: (context) => const DashboardScreen(),
        NotificationScreen.id: (context) => const NotificationScreen(),
        // QueueDetails.id: (context) => const QueueDetails(),
        Positions.id: (context) => const Positions(),
        HomeScreen.id: ((context) => const HomeScreen()),
        QueueJoined.id: ((context) => const QueueJoined(
            token_no: 57, current_token: 54, average_time: 10)),
        ActiveTicket.id: (context) => const ActiveTicket(),
        QueueDetails.routeName: (context) => const QueueDetails(),
        QueuesScreen.routeName: (ctx) => QueuesScreen(),
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
