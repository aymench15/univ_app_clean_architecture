import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/utils/Constances.dart';
import '../screens/home_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.center,
      padding: EdgeInsets.all(18),
      style: GnavStyle.google,
      activeColor: Colors.white,
      gap: 1,
      tabs: [
        GButton(
          icon: Icons.home,
          text: "Home",
          activeBorder: Border.symmetric(),
          hoverColor: Theme.of(context).colorScheme.secondary,
          textColor: Colors.white,
          onPressed: () async {
          List list = await  AppConstances.connect.getAllData();
          print(list);
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => HomeScreen(
                        list: list,
                      )),
            );
          },
        ),
      ],
    );
  }
}
