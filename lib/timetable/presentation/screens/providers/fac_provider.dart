import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../controller/data_bloc/data_bloc.dart';
import '../../controller/data_bloc/data_events.dart';
import '../chose_suite_time.dart';

class FacultyProvider extends StatefulWidget {
  final List list;
  const FacultyProvider({Key? key,required this.list}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _FacProvider createState() => _FacProvider();
}

class _FacProvider extends State<FacultyProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<DataBloc>()..add(FacultyEvents()),
      //..add(DepartmentEvent()),
      child: SuitbaleTime(list :widget.list),
    );
  }

/*
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
              if (index == 0 || index == 1) _currentPage = _pages[index];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/house.svg",
                width: 10.0,
                color: _selectedTab == 0
                    ? Theme.of(context).colorScheme.secondary
                    : kTextColor,
              ),
             // label: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/read_book.svg",
                width: 10.0,
                color: _selectedTab == 1
                    ? Theme.of(context).colorScheme.secondary
                    : kTextColor,
              ),
              //  label: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/homework.svg",
                width: 10.0,
                color: _selectedTab == 2
                    ? Theme.of(context).colorScheme.secondary
                    : kTextColor,
              ),
              //  label: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/comment.svg",
                width: 10.0,
                color: _selectedTab == 3
                    ? Theme.of(context).colorScheme.secondary
                    : kTextColor,
              ),
              //  label: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }*/
}
