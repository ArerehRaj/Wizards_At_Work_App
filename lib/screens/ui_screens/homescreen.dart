import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_queue_management_system_app/screens/ui_screens/bus_screen.dart';
import 'package:smart_queue_management_system_app/screens/ui_screens/doctor_screen.dart';
import 'package:smart_queue_management_system_app/screens/ui_screens/shop_screen.dart';
import 'package:smart_queue_management_system_app/widgets/tabbar.dart';

import 'package:smart_queue_management_system_app/components/category_enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.leanBack,
    ); // to re-show bars
  }

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
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
      children: [DoctorScreen(categoryType: Category.doctor), BusScreen(categoryType: Category.busStop), ShopScreen(categoryType: Category.stores,)],
    );
  }
}
