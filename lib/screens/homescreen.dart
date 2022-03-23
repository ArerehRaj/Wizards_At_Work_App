import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/screens/bus_screen.dart';
import 'package:smart_queue_management_system_app/screens/doctor_screen.dart';
import 'package:smart_queue_management_system_app/screens/shop_screen.dart';
import 'package:smart_queue_management_system_app/widgets/tabbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const TabBarWidget(
      tabs: [
        Tab(
          child: Text(
            "Doctor",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Tab(
          child: Text(
            "Bus",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Tab(
          child: Text(
            "Shop",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
      children: [DoctorScreen(), BusScreen(), ShopScreen()],
    );
  }
}
