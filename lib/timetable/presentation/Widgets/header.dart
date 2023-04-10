import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'drawer.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 101, 226, 160),
            ),
            child: SizedBox(child: Text('Drawer Header')),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Page 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.train,
            ),
            title: const Text('Page 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
       
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          // const Drawerr(),
           
          /*  Text(
              "Univ App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),*/SizedBox(width: 140,),
            CircleAvatar(
              radius: 18.0,
              backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
