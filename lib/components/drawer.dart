import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/break.dart';
import 'package:social_transport/components/drawer_button.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({
    super.key,
  });
  
// ignore: non_constant_identifier_names
  var current_user = FirebaseAuth.instance.currentUser;
  void signout() {
      FirebaseAuth.instance.signOut();
    }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SafeArea(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: ListView(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text("T R A N S P O R T E R"),
                  ],
                ),
                const Break(),
                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.face,
                        size: 50,
                      ),
                      Text(
                        "${current_user!.email}",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const Break(),
                DrawButton(
                  text: "Profile", 
                  icon: Icons.person, 
                  onPressed: (){},
                  red: false
                ),
                DrawButton(
                  text: "Settings",
                  icon: Icons.settings,
                  onPressed: (){},
                  red: false
                ),
                DrawButton(
                  text: "Infos", icon: Icons.info, onPressed: () {}, red : false
                ),
                Align(
                  alignment: const Alignment(0, 1),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: DrawButton(
                      text: "LogOut",
                      icon: Icons.logout,
                      onPressed: signout,
                      red: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}