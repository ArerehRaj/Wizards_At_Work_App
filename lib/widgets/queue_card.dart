import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/screens/queue_details_screen.dart';

class QueueCard extends StatelessWidget {
  QueueCard({ required this.queueID, required this.counter, required this.orgName, required this.orgType,});

  final queueID;
  final counter;
  final orgName;
  final orgType;

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
        // print(userDocument.get('max_tokens'));

        // Adding in queue

        // final tokensArray = userDocument.get('arr_tokens') as List;
        // final lastToken = tokensArray.last as int;
        // final newToken = lastToken + 1;
        // tokensArray.add(newToken);
        // FirebaseFirestore.instance.collection('queue').doc(queueID).update(
        //   {
        //     'arr_tokens':tokensArray,
        //     'token_distributed': userDocument.get('token_distributed') + 1,
        //   }
        // );

        // FirebaseFirestore.instance.collection('token').add({
        //     'token_number':newToken,
        //     'time_stamp': DateTime.now(),
        //     'user_id': FirebaseAuth.instance.currentUser!.uid, 
        //     'queue_id': queueID,
        //     'token_type': 'doctor' or 'shop' or 'bus stop'
        // });
        
    
        //Exit from queue

        // FirebaseFirestore.instance.collection('queue').doc(queueID).update({
        //   'arr_token' : userDocument.get('arr_tokens').remove('token')
        // });

        // One Person per queue
        // final querySnapshot = await FirebaseFirestore.instance
        //   .collection('token')
        //   .where('token_type', isEqualTo: 'doctor')
        //   .where('user_id', isEqualTo: 'user_id')
        //   .get();

        // querySnapshot.size = 1 ? Exit : Join 

        
        return GestureDetector(
          onTap: userDocument.get('status') ? (){
            // one person one queue in one category
            // final data = FirebaseFirestore.instance
            // .collection('token')
            // .where('token_type', isEqualTo: 'doctor')
            // .where('user_id', isEqualTo: '5dhwZmKIAbUDvQg1O81Zb4rb0Xq1')
            // .where('queue_id', isEqualTo: queueID)
            // .get();

            // data.then((value) {
            //   print(value.size);
            //   // print(value.docs.first.get('user_id'));
            //   if(value.size == 1){
            //     print('Exit OPtion');
            //   }
            //   else {
            //     print('Join OPtioj');
            //   }
            // });

            // add in queue

            // final tokensArray = userDocument.get('arr_tokens') as List;
            // final lastToken = tokensArray.last;
            // final newToken = int.parse(lastToken) + 1;
            // tokensArray.add(newToken.toString());
            // FirebaseFirestore.instance.collection('queue').doc(queueID).update(
            //   {
            //     'arr_tokens':tokensArray,
            //     'token_distributed': userDocument.get('token_distributed') + 1,
            //   }
            // );

            // FirebaseFirestore.instance.collection('token').add({
            //     'token_number':newToken,
            //     'time_stamp': DateTime.now(),
            //     'user_id': '5dhwZmKIAbUDvQg1O81Zb4rb0Xq1', // FirebaseAuth.instance.currentUser!.uid, 
            //     'queue_id': queueID,
            //     'token_type': 'doctor',
            // });

            Navigator.pushNamed(context, QueueDetails.routeName, arguments: {'queueData': userDocument, 'queueID': queueID, 'token_type': orgType, 'org_name': orgName, 'org_type': orgType});

          } : (){print('HRHR');},
          child: Card(
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
          ),
        );
      }
    );
    
  }
}