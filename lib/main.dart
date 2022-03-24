import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/screens/ui_screens/homescreen.dart';
import '../screens/queue_details_screen.dart';
import '../screens/queues_screen.dart';

import './screens/options_screen.dart';
import './components/category_enum.dart';
import 'package:smart_queue_management_system_app/screens/notification_screen.dart';

import 'package:smart_queue_management_system_app/screens/auth_screens/login_screen.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/registration_screen.dart';
import '../screens/auth_screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_queue_management_system_app/screens/auth_screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // void _populateOrg() async {
  //   final cityList = ['Vashi', 'Chembur', 'CST', 'Wadala', 'Nerul'];
  //   final orgNameList = ['Appolo', 'LIC', 'Hinduja', 'J M Hospital', 'K K Hospital'];

    // for(int i=0; i<cityList.length; i++){
    //   FirebaseFirestore.instance.collection('organizations').add({
    //     'list_of_queues': [],
    //     'org_city': cityList[i],
    //     'org_name': orgNameList[i],
    //     'org_type': 'Health',
    //   }); 
    // }
  // }

  // void _populateQueue() async {
  //   final avgWTList = [10,12,25,22,5,6];
  //   final arrayOfTokens = [
  //     ['B1', 'B2', 'B3', 'B4'],
  //     ['C1', 'C2', 'C3', 'C4', 'C5'],
  //     ['D1', 'D2', 'D3'],
  //     ['E1', 'E2', 'E3', 'E4', 'E5','E6'],
  //     ['F1','F2'],
  //   ];
  //   final maxTokensList = [25, 20, 25, 25, 15];
  //   final queueDetailsList = [
  //     {'category':'doctor', 'name':'Dr Mayank'},
  //     {'category':'doctor', 'name':'Dr Patel'},
  //     {'category':'doctor', 'name':'Dr Raju'},
  //     {'category':'doctor', 'name':'Dr Chinmay'},
  //     {'category':'doctor', 'name':'Dr Rai'},
  //   ];
  //   final statusList = [true, false, true, true, false];
  //   final tokenDistributedList = [6,3,1,7,5];

  //     for(int i=0; i<avgWTList.length; i++){
  //     FirebaseFirestore.instance.collection('queue').add({
  //       'Avg_wait_time': avgWTList[i],
  //       'arr_tokens': arrayOfTokens[i],
  //       'max_tokens': maxTokensList[i],
  //       'queue_details': queueDetailsList[i],
  //       'status': statusList[i],
  //       'token_distributed': tokenDistributedList[i],
  //     }); 
  //   }
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QEasy',
      initialRoute: 'welcome_screen',
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, usersnapshot){
        if (usersnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        
        if (usersnapshot.hasData) {
          return HomeScreen();
            // return const UserProfileScreen();
            // user is authenticated
            // return const TabsScreen();
          }
        // _populateOrg();
        //_populateQueue();
        return WelcomeScreen();
        // return OptionsScreen(categoryType: Category.doctor,);
      },
      ),
    routes: {
        'welcome_screen': (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        DashboardScreen.id: (context) => const DashboardScreen(),
        NotificationScreen.id: (context) => const NotificationScreen(),
        QueuesScreen.routeName: (ctx) => const QueuesScreen(),
        QueueDetails.routeName: (ctx) => const QueueDetails(),
    },
    );
  }
}
