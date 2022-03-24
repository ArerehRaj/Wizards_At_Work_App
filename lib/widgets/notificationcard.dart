import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String name;
  final String message;
  const NotificationCard({Key? key, required this.name, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 18),
            )
          ]),
        ),
      ),
    );
  }
}
