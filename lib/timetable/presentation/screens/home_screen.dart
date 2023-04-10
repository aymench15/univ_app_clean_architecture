import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_themes/app_theme_darkmode.dart';
import '../../../core/theme/toggle_theme_bloc/Theme_event.dart';
import '../../../core/theme/toggle_theme_bloc/theme_bloc.dart';
import '../../../core/utils/Constances.dart';
import '../Widgets/drawer.dart';
import '../Widgets/recent_alerts.dart';
import 'providers/fac_provider.dart';

class HomeScreen extends StatefulWidget {
   List list;
  HomeScreen({super.key, required this.list});
  _HomeScrn createState() => _HomeScrn();
}

class _HomeScrn extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    //  ThemeBloc theme = BlocProvider.of<ThemeBloc>(context, listen: false);
    bool status = false;
    int tabSelected = 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '',
        ),
        // backgroundColor: theme.,
        actions: [
          /* IconButton(icon:Icon(Icons.light_mode,) ,onPressed: (){
            theme.change_theme();*/

          BlocBuilder<ThemeBloc, ThemeData>(builder: (context, themeData) {
            return FlutterSwitch(
                value: themeData == darkMode,
                activeColor: Theme.of(context).colorScheme.onSurface,
                activeIcon: const Icon(Icons.dark_mode, color: Colors.black),
                inactiveIcon: const Icon(Icons.light_mode, color: Colors.black),
                activeText: "Night",
                inactiveText: "Light",
                width: 80,
                showOnOff: true,
                onToggle: (bool val) {
                  BlocProvider.of<ThemeBloc>(context).add(ThemeSwitchEvent());
                });

            /*  CupertinoSwitch(
                  value: themeData == darkMode,
                  onChanged: );
            },*/
          })
        ],
      ),
      drawer: Drawerr(list: widget.list,),
      body: SingleChildScrollView(
        key: const Key('ScrollView'),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 45,
                      ),

                      /// Tab Options ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: tabSelected == 1
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xffA2834D),
                                                Color(0xffBC9A5F)
                                              ],
                                              begin: FractionalOffset.topRight,
                                              end: FractionalOffset.bottomLeft))
                                      : const BoxDecoration(),
                                  child: Image.asset(
                                    "assets/images/auth.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                onTap: () {
                                  print("Schedule");
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Auth",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: tabSelected == 1
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xffA2834D),
                                                Color(0xffBC9A5F)
                                              ],
                                              begin: FractionalOffset.topRight,
                                              end: FractionalOffset.bottomLeft))
                                      : const BoxDecoration(),
                                  child: Image.asset(
                                    "assets/images/schedule.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FacultyProvider(
                                              list: widget.list,
                                            )),
                                  ).then(onGoBack);
                                },
                              ),
                             const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Schedule",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        gradient: LinearGradient(
                                            colors: [
                                              const Color(0xffA2834D),
                                              const Color(0xffBC9A5F)
                                            ],
                                            begin: FractionalOffset.topRight,
                                            end: FractionalOffset.bottomLeft)),
                                    child: Image.asset(
                                      "assets/images/bus.png",
                                      width: 30,
                                      height: 30,
                                    )),
                                onTap: () {},
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Bus Truck",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Header(),
            const SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.all(35.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Recent Cours",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  RecentsAlerts(list: widget.list),
                  /*  Center(
                    child: Text(
                      "View all",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15.0),
                    ),
                  ),*/
                ],
              ),
            ),
            //  const FacultyWidget(),
            // _bottomNavigator()
            //  _bottomNav()
          ],
        ),
      ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    //refreshData();
    setState(() {
       AppConstances.connect.getAllData().then((value) => widget.list = value);
     // isSelected = true;
    });
  }

  Future<void> getData(list) async {
    List<dynamic> listing = await AppConstances.connect.getAllData();
    if (listing.length > 0) {
      list = listing;
    }
    list = [];
  }
}
