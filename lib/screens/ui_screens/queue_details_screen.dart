import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/scheme.dart';
import 'package:smart_queue_management_system_app/components/queue_details_grid.dart';

class QueueDetails extends StatefulWidget {
  const QueueDetails({Key? key}) : super(key: key);
  static const String id = 'queue_details_screen';
  @override
  _QueueDetailsState createState() => _QueueDetailsState();
}

class _QueueDetailsState extends State<QueueDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width / 1.25,
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: FittedBox(
              child: Image.asset('images/hospital.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: QueueDetailsGrid(
                nameOfHospital: 'M.K Gandhi Hospital',
                nameOfDoctor: 'Dr. Chinmay',
                noOfPeopleInFront: '18',
                timeLeftInMins: '32',
                noOfDistributedTokens: '11',
                noOfTokensAvailable: '39',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
