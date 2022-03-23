import 'package:flutter/material.dart';

import '../screens/queues_screen.dart';

class OrganizationCard extends StatelessWidget {
  OrganizationCard({required this.orgDetails, required this.categoryType});

  final orgDetails;
  final categoryType;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6,),
      // shape: Border(left: BorderSide(color: Colors.blue.shade300, width: 5),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      shadowColor: Colors.grey,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(
            context,
            QueuesScreen.routeName, 
            arguments: orgDetails,
          );
        },
        child: ListTile(
          leading: SizedBox(child: Image.asset(
                  'assets/images/brand-image.png',
                  fit: BoxFit.cover,
                ),
              ),
          title: Text(orgDetails['org_name']), 
          trailing: FittedBox(
            child: Row(
              children: [
                const Icon(Icons.location_on, size: 20, color: Colors.black,),
                Text(orgDetails['org_city']),
              ],
            ),
          ),
          subtitle: Text(orgDetails['org_type']),
          ),
      ),
    );
  }
}