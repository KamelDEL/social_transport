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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'T R A N S P O R T E R',
          style: TextStyle(
            fontSize: 13,
            color: Colors.blue
          ),),
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: createNewTransfer,
        child: Icon(
          Icons.add,
          color: Colors.white.withAlpha(90),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
      body: _children[_selectedIndex],
    );
  }
}