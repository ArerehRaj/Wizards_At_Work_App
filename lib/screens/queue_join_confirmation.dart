import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/screens/ui_screens/homescreen.dart';
import 'package:smart_queue_management_system_app/main.dart';

class QueueJoined extends StatelessWidget {
  static const String id = 'queue_join_confirmation';
  final int token_no;
  final int current_token;
  final int average_time;
  const QueueJoined(
      {Key? key,
      required this.token_no,
      required this.current_token,
      required this.average_time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int token_difference = token_no - current_token;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Queue joined successfully",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 80,
              ),
              const Text(
                "Token Number",
                style: TextStyle(fontSize: 35),
              ),
              Text(
                token_no.toString(),
                style:
                    const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60,
              ),
              const Text(
                "Estimated wait time",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "${(token_difference * average_time).toString()} mins",
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    child: Text(
                      "Back to Home",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
