import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './screens/options_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QEasy',
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, usersnapshot){
        if (usersnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        
        // if (usersnapshot.hasData) {
        //     // return const UserProfileScreen();
        //     // user is authenticated
        //     // return const TabsScreen();
        //   }
        return const OptionsScreen();
      },),
    );
  }
}