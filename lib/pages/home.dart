import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/drawer.dart';
import 'package:social_transport/pages/add_transfer.dart';
import 'package:social_transport/pages/profile.dart';
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
  int _selectedIndex = 0;
  final List<Widget> _children = [
    const Transfers(),
    const Profile(),
  ];
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
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
        drawer: MediaQuery.of(context).size.shortestSide<700? Drawer(
          child: MyDrawer(),
        ):null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:MediaQuery.of(context).size.shortestSide<700? FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: createNewTransfer,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
        ):null,
        bottomNavigationBar: MediaQuery.of(context).size.shortestSide<700? BottomNavigationBar(
          fixedColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _navigateBottomBar,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "history"),
          ],
        ):null,
        body: MediaQuery.of(context).size.shortestSide<700? _children[_selectedIndex]
        :Row(
          children: [
            MyDrawer(), 
            Expanded(
              child: _children[_selectedIndex]
            ),]
          )),
    );
  }
}