import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QueueCard extends StatelessWidget {
  QueueCard({ required this.queueID, required this.counter, });

  final queueID;
  final counter;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('queue').doc(queueID).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        var userDocument = snapshot.data as DocumentSnapshot;
        print(userDocument.get('max_tokens'));
        
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3.0,
          child: 
              Container(
                width: deviceSize.width,
                height: 150,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Row(children: [
                    Expanded(child: Container(height: 150 , color: Colors.blue.shade400, child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text((counter + 1).toString(), style: const TextStyle(fontSize: 30, color: Colors.white),),
                        SizedBox(height: deviceSize.height * 0.025,),
                        Text(userDocument.get('status') ? 'Open' : 'Closed', style: const TextStyle(fontSize: 20, color: Colors.white),),
                    ]),), flex: 3,),
                    Expanded(child: Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(userDocument.get('queue_details')['name'], style: TextStyle(fontSize: 25,),),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      (userDocument.get('Avg_wait_time')).toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text("Avg Wait Time",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text((userDocument.get('arr_tokens').length).toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text("Persons in Queue",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text((userDocument.get('arr_tokens')[0]).toString(),
                        style: const TextStyle(fontSize: 20)),
                    const Text(
                      "Ongoing token",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
                      ],),
                    ), 
                      flex: 7,),
                  ]),
                ),
              ),
        );
      }
    );
    
  }
}