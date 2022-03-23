import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/scheme.dart';
import 'package:smart_queue_management_system_app/widgets/ticketupdate.dart';

class ActiveTicket extends StatefulWidget {
  const ActiveTicket({Key? key}) : super(key: key);

  @override
  State<ActiveTicket> createState() => _ActiveTicketState();
}

class _ActiveTicketState extends State<ActiveTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TicketUpdate(
                  timestamp: DateTime.now(),
                  token_no: 57,
                  average_time: 10,
                  name: "Dr R.M. Kelkar",
                  current_token: 54),
            ],
          ),
        ),
      ),
    );
  }
}
