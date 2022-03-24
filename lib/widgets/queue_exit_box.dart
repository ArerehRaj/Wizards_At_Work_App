import 'package:flutter/material.dart';

class QueueExitBox extends StatefulWidget {
  const QueueExitBox({Key? key}) : super(key: key);

  @override
  State<QueueExitBox> createState() => _QueueExitBoxState();
}

class _QueueExitBoxState extends State<QueueExitBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you sure you want to exit the queue?"),
      actions: [
        ElevatedButton(onPressed: () {}, child: Text("Yes")),
        ElevatedButton(onPressed: () {}, child: Text("NO"))
      ],
    );
  }
}

/*  GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return QueueExitBox();
                      });
                },
                child: TicketUpdate(
                    timestamp: DateTime.now(),
                    token_no: 57,
                    average_time: 10,
                    name: "Dr R.M. Kelkar",
                    current_token: 54),
              ), */
