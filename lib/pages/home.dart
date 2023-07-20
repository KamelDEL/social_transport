import 'package:flutter/material.dart';
import 'package:social_transport/components/post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.emoji_transportation),
            Text(
              'T R A N S P O R T E R',
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        child: const Icon(Icons.add)
      ),
      body: ListView(
        children: const  [
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 32KG and i need it to be in algiers as fast as possible weigh of 32KG and i need it to be in algiers as fast as possible weigh of 32KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 52KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 42KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 98KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 32KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 52KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 42KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 98KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 32KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 52KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 42KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 98KG and i need it to be in algiers as fast as possible'),
        ],
      ),
    );
  }
}