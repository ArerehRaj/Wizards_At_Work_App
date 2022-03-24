import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/components/category_enum.dart';
import '../widgets/organization_card.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({ Key? key , required this.categoryType,}) : super(key: key);
  final String categoryType;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
       
      body: Container(
      height: deviceSize.height,
      width: deviceSize.width,
      margin: const EdgeInsets.all(10),
      child: 
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('organizations').where('org_type', isEqualTo: categoryType).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
            child: CircularProgressIndicator(),
            );
          }
          var organizationsList = snapshot.data!.docs;
          
          return organizationsList.isEmpty? const Center(child: Text('No organization available'),) : ListView.builder(
            itemBuilder: (ctx, index){
              return OrganizationCard(orgDetails: organizationsList[index].data(), categoryType: categoryType,);
            },
            itemCount: organizationsList.length,
          );
        },
        ),
    ),);
  }
}
