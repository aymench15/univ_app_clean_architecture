import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/Constances.dart';
import '../screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
  
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[

            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
               color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
            ),
            Positioned(
              top: 100.0,
              left: 70.0,
              right: 70.0,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    child: SvgPicture.asset(
                      "assets/icons/grad_cap.png",
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                  Text(
                    "UnivApp",
                    style: TextStyle(
                       color:  Theme.of(context)
                                  .colorScheme
                                  .onSecondary,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 170.0,
              left: 50.0,
              right: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                       color:  Theme.of(context)
                                  .colorScheme
                                  .onSecondary,
                      fontSize: 29.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Check your timetable and bus truck and more!",
                    style: TextStyle(
                       color:  Theme.of(context)
                                  .colorScheme
                                  .onSecondary,
                     // color: kTextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 130,
              left: 80.0,
              right: 80.0,
              child: GestureDetector(
                onTap: () async {
                  final list = await AppConstances.connect.getAllData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen(list: list)),
                  );
                },
                child: Container(
                  width: 150.0,
                  height: 55.0,
                  padding: EdgeInsets.only(left: 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "GET STARTED",
                        style: TextStyle(
                           color:  Theme.of(context)
                                  .colorScheme
                                  .onSecondary,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 28.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
