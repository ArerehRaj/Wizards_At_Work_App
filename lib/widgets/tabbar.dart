import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/components/menu_item.dart';

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
            centerTitle: true,
            title: Text(
              "QEasy",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color(0xff1D2033),
            toolbarHeight: 60,
            actions: <Widget>[
              PopupOptionMenu(),
              // IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.more_vert_rounded,
              //       color: Colors.white,
              //     ))
            ],
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

enum MenuOption { Active_Token, Notification }

class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (BuildContext context) {
      return <PopupMenuEntry<MenuOption>>[
        PopupMenuItem(
          child: Text('Active Token'),
          value: MenuOption.Active_Token,
        ),
        PopupMenuItem(
          child: Text('Notification'),
          value: MenuOption.Notification,
        ),
      ];
    });
  }
}
