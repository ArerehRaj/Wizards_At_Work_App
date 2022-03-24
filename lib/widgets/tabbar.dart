import 'package:flutter/material.dart';
import 'package:smart_queue_management_system_app/screens/active_ticket.dart';
import 'package:smart_queue_management_system_app/screens/notification_screen.dart';

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
            elevation: 0.0,
            actions: <Widget>[
              PopupMenuButton(
              // on selecting the logout option this code gets
              // executed and the user gets logout
              onSelected: (result) {
                if (result == 0) {
                  Navigator.of(context).pushNamed(ActiveTicket.id);
                  // Provider.of<Auth>(context, listen: false).logout();
                }

                else if (result == 1) {
                  Navigator.of(context).pushNamed(NotificationScreen.id);
                  // Provider.of<Auth>(context, listen: false).logout();
                }
              },
              itemBuilder: (_) => [
                // option 1 i.e. logout
                const PopupMenuItem(
                  child: Text('Active Token'),
                  value: 0, // setting the value to 0
                ),
                const PopupMenuItem(
                  child: Text('Notifications'),
                  value: 1, // setting the value to 0
                ),
              ],
              // icon for verticle 3 dots
              icon: const Icon(Icons.more_vert, color: Colors.black,),
            ),
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
   return PopupMenuButton(itemBuilder: (BuildContext context){
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
   },
   );
  }
}
