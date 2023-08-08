import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:social_transport/components/drawer.dart';
import 'package:social_transport/components/users_msg.dart';
import 'package:social_transport/pages/add_transfer.dart';
import 'package:social_transport/pages/transfers.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var sunny = false;
  void signout() {
    FirebaseAuth.instance.signOut();
  }
  void createNewTransfer(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTransfer()),
    );
  }
  void openEndDrawer(){
    Scaffold.of(context).openEndDrawer();
  }
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    
    return Slidable(
      enabled: true,
      startActionPane: MediaQuery.of(context).size.width < 910 ? ActionPane(
          extentRatio: MediaQuery.of(context).size.width > 500 ? 0.4 : 0.7,
          motion: const BehindMotion(),
          children: [
            MyDrawer(),
          ]):null,
      endActionPane: MediaQuery.of(context).size.width < 600 ? ActionPane(
          extentRatio:  MediaQuery.of(context).size.width < 500 ? 0.7 : 0.4,
          motion: const BehindMotion(),
          children: const[
            UsersMsgs(),
          ]) : null,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]
        ),
        child: Scaffold(
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
          ),
          // drawer: MediaQuery.of(context).size.shortestSide<700? Drawer(
          //   child: MyDrawer(),
          // ):null,
          floatingActionButton: Align(
            alignment: MediaQuery.of(context).size.width<650? const Alignment(1, 1) : const Alignment(0.6, 1),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: createNewTransfer,
              child: const Icon(
                Icons.create,
                color: Colors.white,
              ),
            ),
          ),
          body: Row(
            children: [
              MediaQuery.of(context).size.width>1300? Expanded(flex:1,child: Container()): const SizedBox(),
              MediaQuery.of(context).size.width >910? MyDrawer(): const SizedBox(), 
              const Expanded(
                flex: 2,
                child: Transfers(),
              ),
              MediaQuery.of(context).size.width >650? const Expanded(
                flex: 1,
                child: UsersMsgs(),
              ) : const SizedBox(),
              MediaQuery.of(context).size.width >1300? Expanded(flex: 1,child: Container()): const SizedBox(),
              
              ]
            )),
      ),
    );
  }
}