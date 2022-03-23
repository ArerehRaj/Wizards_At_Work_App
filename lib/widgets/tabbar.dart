import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget({
    Key? key,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Qeasy",
              style: TextStyle(fontSize: 25),
            ),
            backgroundColor: Color(0xff1D2033),
            toolbarHeight: 60,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: tabs,
            ),
          ),
          body: SafeArea(child: TabBarView(children: children)),
        ),
      );
}
