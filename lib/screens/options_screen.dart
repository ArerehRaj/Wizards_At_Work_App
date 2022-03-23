import 'package:flutter/material.dart';
import '../widgets/organization_card.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Organization'),
        ), 
      body: Container(
      height: deviceSize.height,
      width: deviceSize.width,
      margin: const EdgeInsets.all(10),
      child: 
        ListView.builder(
          itemBuilder: (ctx, index){
            return const OrganizationCard();
          },
          itemCount: 5,
        ),
      
    ),);
  }
}
