import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import '../Widgets/bottom_navigation.dart';
import '../Widgets/build_classes.dart';
import '../Widgets/header.dart';

class ClassesScreen extends StatefulWidget {
  final List list;
  final bool froMyLocal;
  const ClassesScreen({super.key, required this.list,required this.froMyLocal});

  @override
  ClassesScreenState createState() => ClassesScreenState();
}

class ClassesScreenState extends State<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(40.0),
          decoration: BoxDecoration(
         color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80.0),
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(80.0)),
          ),
          child: Column(
            children: <Widget>[
              BuildClasses(list: widget.list,fromMyLocal: widget.froMyLocal,),
            ],
          ),
        ),
      ],
    );
  }
}
