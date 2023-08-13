import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:social_transport/components/drawer.dart';
import 'package:social_transport/components/msg_box.dart';
import 'package:social_transport/pages/add_transfer.dart';
import 'package:social_transport/pages/message_box.dart';
import 'package:social_transport/pages/profile.dart';
import 'package:social_transport/pages/transfers.dart';

import 'notifications.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var sunny = false;
  late final SlidableController controller;
  void signout() {
    FirebaseAuth.instance.signOut();
  }
  void redirectToPage(page){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
  void openEndDrawer(){
    Scaffold.of(context).openEndDrawer();
  }
  bool enabled = false;
  
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final phone = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'T R A N S P O R T E R',
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).colorScheme.secondary
          ),),
        actions: [
            phone? IconButton(
              onPressed: () {
                redirectToPage(const MessageBox());
              }, 
              icon:const  Icon(Icons.message),
            ): TextButton(onPressed: () {redirectToPage(const MsgBox());}, child: Text("Messages")),
            phone?IconButton(
              onPressed: () {
                redirectToPage(const Notifications());
              }, 
              icon: const Icon(Icons.notifications),
            ): TextButton(onPressed: () {redirectToPage(const Notifications());}, child: Text("Notifications")),
            phone? IconButton(
              onPressed: () {
                redirectToPage(const Profile());
              },
              icon: const Icon(Icons.person),
            ) : TextButton(onPressed: () {redirectToPage(const Profile());}, child: Text("Profile")),
            phone? const SizedBox(width: 20):const SizedBox(width:100),

        ],
      ),
      // drawer: MediaQuery.of(context).size.shortestSide<700? Drawer(
      //   child: MyDrawer(),
      // ):null,
      floatingActionButton: Align(
        alignment: MediaQuery.of(context).size.width<800? const Alignment(1, 1) : const Alignment(1, 1),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {redirectToPage(const AddTransfer());},
          child: const Icon(
            Icons.create,
            color: Colors.white,
          ),
        ),
      ),
      body: Slidable(
          startActionPane: phone
              ? ActionPane(
                  extentRatio: 0.4,
                  motion: const BehindMotion(),
                  children: [
                      MyDrawer(),
                    ])
              : null,
        child: Row(
          children: [
            MediaQuery.of(context).size.width > 700
                ? MyDrawer(): const SizedBox(), 
            const Expanded(
              flex: 3,
              child: Transfers(),
            ),
            MediaQuery.of(context).size.width >1300? Expanded(flex: 1,child: Container()): const SizedBox(),
            
            ]
          ),
      ));
  }
}