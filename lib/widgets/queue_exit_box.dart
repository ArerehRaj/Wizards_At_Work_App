import 'package:flutter/material.dart';

class QueueExitBox extends StatefulWidget {
  const QueueExitBox({Key? key, required this.exitFunction, }) : super(key: key);

  final exitFunction;

  @override
  State<QueueExitBox> createState() => _QueueExitBoxState();
}

class _QueueExitBoxState extends State<QueueExitBox> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text("Are you sure you want to exit the queue?"),
      actions: [
        ElevatedButton(onPressed: () {
          widget.exitFunction();
          Navigator.of(context).pop();
        }, child: Text("Yes")),
        ElevatedButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text("NO"))
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
