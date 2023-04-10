/*import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/constants.dart';
import '../compenents/home_screemn.dart';
import '../compenents/timeTable.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedTab = 0;
 //  Widget _currentPage = const ClassesScreen();
   final _homeScreen = const HomeScreen();
  late List<Widget> _pages ;
  //late HomeScreen _homeScreen;
  late ClassesScreen _classesScreen;

  @override
  void initState() {
    super.initState();
   // _classesScreen =const ClassesScreen();
    _pages = [_homeScreen, _classesScreen];
  //  _currentPage = _homeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
        //  _currentPage,
         // _bottomNavigator()
          
        ],
      ),
    );
  }

  Widget _bottomNavigator() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).backgroundColor,
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
           //   if (index == 0 || index == 1) 
             //   _currentPage = _pages[index];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/house.svg",
                width: 10.0,
                color: _selectedTab == 0 ? Theme.of(context).colorScheme.secondary : kTextColor,
              ),
             // label: SizedBox.shrink()
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/read_book.svg",
                width: 10.0,
                color: _selectedTab == 1 ? Theme.of(context).colorScheme.secondary : kTextColor,
              ),
            //  label: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/homework.svg",
                width: 10.0,
                color: _selectedTab == 2 ? Theme.of(context).colorScheme.secondary : kTextColor,
              ),
            //  label: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/comment.svg",
                width: 10.0,
                color: _selectedTab == 3 ? Theme.of(context).colorScheme.secondary : kTextColor,
              ),
            //  label: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
*/