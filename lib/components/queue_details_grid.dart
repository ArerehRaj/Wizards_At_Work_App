import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/category_enum.dart';
import '../widgets/queue_exit_box.dart';

class QueueDetailsGrid extends StatefulWidget {
  const QueueDetailsGrid({
    Key? key,
    required this.nameOfHospital,
    required this.nameOfDoctor,
    required this.noOfPeopleInFront,
    required this.timeLeftInMins,
    required this.noOfDistributedTokens,
    required this.noOfTokensAvailable,
    required this.queueData,
    required this.queueID,
    required this.categoryType,
  }) : super(key: key);
  final String nameOfHospital;
  final String nameOfDoctor;
  final String noOfPeopleInFront;
  final String timeLeftInMins;
  final String noOfDistributedTokens;
  final String noOfTokensAvailable;
  final queueData;
  final queueID;
  final categoryType;

  @override
  State<QueueDetailsGrid> createState() => _QueueDetailsGridState();
}

class _QueueDetailsGridState extends State<QueueDetailsGrid> {

  bool _isBooked = false;
  bool _isAnotherBooked = false;
  bool _isLoading = false;

  void exitFromQueue() async {
    setState(() {
      _isLoading = true;
    });
    final data = await FirebaseFirestore.instance
            .collection('token')
            .where('token_type', isEqualTo: widget.categoryType)
            .where('user_id', isEqualTo: '5dhwZmKIAbUDvQg1O81Zb4rb0Xq1')
            .where('queue_id', isEqualTo: widget.queueID)
            .get();

        final queueChange = await FirebaseFirestore.instance.collection('queue').doc(widget.queueID).get();
        final ogQueue = queueChange.get('arr_tokens') as List;
        ogQueue.remove(data.docs.first.get('token_number').toString());

        await FirebaseFirestore.instance.collection('queue').doc(widget.queueID).update({'arr_tokens':ogQueue});

        await data.docs.first.reference.delete();

        setState(() {
          _isBooked = false;
          _isLoading = false;
        });
  }

  void checkIfQueueBooked() async {
    final data = await FirebaseFirestore.instance
            .collection('token')
            .where('token_type', isEqualTo: widget.categoryType)
            .where('user_id', isEqualTo: '5dhwZmKIAbUDvQg1O81Zb4rb0Xq1')
            .where('queue_id', isEqualTo: widget.queueID)
            .get();

              // print(value.docs.first.get('user_id'));
              if(data.size == 1){
                // print('Exit OPtion');
                setState(() {
                  _isBooked = true;
                });
              }
              else {
                // print('Join OPtioj');
                final newData = await FirebaseFirestore.instance
            .collection('token')
            .where('token_type', isEqualTo: widget.categoryType)
            .where('user_id', isEqualTo: '5dhwZmKIAbUDvQg1O81Zb4rb0Xq1').get();
            
              if(newData.size == 1){
                // print('Exit OPtion');
                setState(() {
                  _isAnotherBooked = true;
                });
              }
              else {
                    setState(() {
                  _isBooked = false;
                });
              }
            }

            setState(() {
              _isLoading = false;
            });
              
  }

  @override
  void initState(){
    super.initState();
    _isLoading = true;
    checkIfQueueBooked();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            widget.nameOfHospital,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            widget.nameOfDoctor,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.noOfPeopleInFront,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'People',
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('in Front Of You')],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.timeLeftInMins,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Minutes',
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('until your turn.')],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.noOfDistributedTokens,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Tokens',
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('have been distributed')],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.noOfTokensAvailable,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Tokens',
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('available')],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: _isBooked ? (){
                showDialog(
                      context: context,
                      builder: (context) {
                        return QueueExitBox(exitFunction: exitFromQueue, isBooked:  _isBooked,);
                      });
                // exitFromQueue();
              } : () {
                final tokensArray = widget.queueData.get('arr_tokens') as List;
                final lastToken = tokensArray.last;
                final newToken = int.parse(lastToken) + 1;
                tokensArray.add(newToken.toString());
                FirebaseFirestore.instance.collection('queue').doc(widget.queueID).update(
                  {
                    'arr_tokens':tokensArray,
                    'token_distributed': widget.queueData.get('token_distributed') + 1,
                  }
                );

                FirebaseFirestore.instance.collection('token').add({
                    'token_number':newToken,
                    'time_stamp': DateTime.now(),
                    'user_id': '5dhwZmKIAbUDvQg1O81Zb4rb0Xq1', // FirebaseAuth.instance.currentUser!.uid, 
                    'queue_id': widget.queueID,
                    'token_type': widget.categoryType,
                });

                // set state to booked
                setState(() {
                  _isBooked = true;
                });
              },
              child: _isLoading ? const CircularProgressIndicator(color: Colors.white,) : Text(_isAnotherBooked ? 'Already in Another Queue' : _isBooked ? 'Exit' : 'Book Queue'),
            ),
          ),
        )
      ],
    );
  }
}
