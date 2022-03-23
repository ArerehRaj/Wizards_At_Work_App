import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/scheme.dart';
import 'package:smart_queue_management_system_app/widgets/queue_exit_box.dart';
import 'package:smart_queue_management_system_app/widgets/ticketupdate.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Hi"));
  }
}
