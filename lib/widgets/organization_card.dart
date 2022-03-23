import 'package:flutter/material.dart';

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(child: Image.asset(
              'assets/images/brand-image.png',
              fit: BoxFit.cover,
            ),
          ),
      title: const Text('Org Name'), 
      trailing: const Text('City'),
      subtitle: const Text('Sub Title'),
      );
  }
}