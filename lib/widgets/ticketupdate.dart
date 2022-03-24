import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketUpdate extends StatelessWidget {
  final Timestamp timestamp;
  final int token_no;
  final int average_time;
  final String name;
  final int current_token;

  const TicketUpdate(
      {Key? key,
      required this.timestamp,
      required this.token_no,
      required this.average_time,
      required this.name,
      required this.current_token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int token_difference = token_no - current_token;

    DateTime dt = timestamp.toDate();

    var now = dt;
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(dt);
    String formattedDate = formatter.format(dt);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  Text("Booked At  $formattedDate $formattedTime",
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      (token_difference * average_time).toString(),
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const Text("Minutes to go     ",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Text((token_difference).toString(),
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    const Text("Persons ahead of you",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text((current_token).toString(),
                        style:
                            const TextStyle(fontSize: 35, color: Colors.blue)),
                    const Text(
                      "Ongoing token number",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Token Number",
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
          Text(
            token_no.toString(),
            style: const TextStyle(
                fontSize: 70, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
