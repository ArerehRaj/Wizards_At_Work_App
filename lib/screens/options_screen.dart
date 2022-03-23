import 'package:cloud_firestore/cloud_firestore.dart';
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
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('organizations').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
            child: CircularProgressIndicator(),
            );
          }
          var organizationsList = snapshot.data!.docs;
          
          return organizationsList.isEmpty? const Center(child: Text('No organization available'),) : ListView.builder(
            itemBuilder: (ctx, index){
              return OrganizationCard(orgDetails: organizationsList[index].data(),);
            },
            itemCount: organizationsList.length,
          );
        },
        ),
    ),);
  }
}
