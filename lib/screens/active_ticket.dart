import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/scheme.dart';
import 'package:smart_queue_management_system_app/widgets/ticketupdate.dart';

class ActiveTicket extends StatefulWidget {
  static const String id = 'active_ticket';
  const ActiveTicket({Key? key}) : super(key: key);

  @override
  State<ActiveTicket> createState() => _ActiveTicketState();
}

class _ActiveTicketState extends State<ActiveTicket> {
  Future<DocumentSnapshot> getqueuedetails(String queueId) async {
    final data =
        await FirebaseFirestore.instance.collection('queue').doc(queueId).get();

    return data;
  }

  @override
  Widget build(BuildContext context) {
    int avg = 8;
    String name = "Dr RM kelkar";
    List curr_token = ["1"];
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Booked Tickets"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('token')
            .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var tokenList = snapshot.data!.docs;
          return tokenList.isEmpty
              ? const Center(
                  child: Text("Join a queue to watch tickets"),
                )
              : ListView.builder(
                  itemCount: tokenList.length,
                  itemBuilder: (context, index) {
                    final data =
                        getqueuedetails(tokenList[index].get('queue_id'));
                    print(
                        data.then((value) => avg = value.get('Avg_wait_time')));
                    print(data.then((value) =>
                        curr_token = value.get('arr_tokens').toList()));

                    print(data.then(
                        (value) => name = value.get('queue_details')['name']));

                    return TicketUpdate(
                        timestamp: tokenList[index].get('time_stamp'),
                        token_no: tokenList[index].get('token_number'),
                        average_time: avg,
                        name: name,
                        current_token: int.parse(curr_token[0]));
                  });
        },
        /*  child: Padding(
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
        ), */
      ),
    );
  }
}
