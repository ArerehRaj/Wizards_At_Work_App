import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/scheme.dart';
import 'package:smart_queue_management_system_app/widgets/queue_exit_box.dart';
import 'package:smart_queue_management_system_app/widgets/ticketupdate.dart';

import 'package:learning_translate/learning_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_queue_management_system_app/components/convert_text.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String hello = 'How are you?';
  // void convertText() async {
  //   Translator translator = Translator(from: ENGLISH, to: HINDI);
  //   String translatedText = await translator.translate(hello);
    
  //   print(translatedText);
  //   setState(() {
  //     hello = translatedText;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // final SharedPreferences prefs = await _prefs;
    // prefs.setBool('isLocalization', true);

    // prefs.getBool('isLocalization')! ? convertText() : null ;
    // convertText();
    Future<String> convertedText = convertText(hello);
    convertedText.then((value){
      setState(() {
        hello = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text(hello);
  }
}
