import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  
// ignore: non_constant_identifier_names
  var current_user = FirebaseAuth.instance.currentUser;
  void signout() {
      FirebaseAuth.instance.signOut();
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
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
                  SizedBox(
                      height: 1,
                      width: 200,
                      child: Container(
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Logged in as ${current_user!.email}"),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    height: 50,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    height: 50,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: signout,
              height: 50,
              child: const Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "LogOut",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}