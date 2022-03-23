import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/widgets/queue_card.dart';

class QueuesScreen extends StatelessWidget {
  const QueuesScreen({ Key? key }) : super(key: key);

  static const routeName = '/queues-screen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(args['org_name']), centerTitle: true,),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        margin: const EdgeInsets.all(10),
        child: args['list_of_queues'].isEmpty ? const Center(child: Text('No Queues Available now'),) : ListView.builder(
          itemBuilder: (ctx, index){
            return QueueCard(queueID: args['list_of_queues'][index], counter: index,);
          },
          itemCount: args['list_of_queues'].length,
        )
      ),
    );
  }
}