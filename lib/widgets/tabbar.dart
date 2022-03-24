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
              style: TextStyle(fontSize: 30, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            toolbarHeight: 60,
<<<<<<< HEAD
            actions: <Widget>[
              PopupOptionMenu(),
              // IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.more_vert_rounded,
              //       color: Colors.white,
              //     ))
=======
            elevation: 0.0,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.black,
                  ))
>>>>>>> 85033a10ca07e16a80a77cd2bd0701b8f8aefbb1
            ],
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: Colors.blue),
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
