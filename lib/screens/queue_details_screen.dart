import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/components/queue_details_grid.dart';

class QueueDetails extends StatefulWidget {
  const QueueDetails({Key? key}) : super(key: key);
  static const String routeName = 'queue_details_screen';
  @override
  _QueueDetailsState createState() => _QueueDetailsState();
}

class _QueueDetailsState extends State<QueueDetails> {
  @override
  Widget build(BuildContext context) {
    final argsData = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Color(0xff1d2033),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width / 1.25,
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: FittedBox(
              child: Image.asset('assets/images/brand-image.png'),
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
                nameOfHospital: argsData['org_name'].toString(),
                nameOfDoctor: argsData['queueData'].get('queue_details')['name'].toString(),
                noOfPeopleInFront: argsData['queueData'].get('arr_tokens').length.toString(),
                timeLeftInMins: (argsData['queueData'].get('arr_tokens').length * argsData['queueData'].get('Avg_wait_time')).toString(),
                noOfDistributedTokens: argsData['queueData'].get('token_distributed').toString(),
                noOfTokensAvailable: (argsData['queueData'].get('max_tokens') - argsData['queueData'].get('token_distributed')).toString(),
                queueData: argsData['queueData'],
                queueID: argsData['queueID'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}