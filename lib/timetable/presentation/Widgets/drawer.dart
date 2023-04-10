import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/providers/fac_provider.dart';

class Drawerr extends StatelessWidget {
  final List list;
  const Drawerr({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                //  color: Color.fromARGB(50, 0, 0, 0),
                ),
            child: ClipRRect(
              child: SvgPicture.asset(
                "assets/icons/grad_cap.png",
                height: 120.0,
                width: 120.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            title: Text('Home',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.perm_identity,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            title: Text(
              'Auth',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.schedule,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            title: Text(
              'Schedule',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => FacultyProvider(
                          list: list,
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.bus_alert,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            title: Text(
              'Bus Truck',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
