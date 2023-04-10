import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/utils/constants.dart';

// rani hna chof card and so one
class GroupCards extends StatefulWidget {
  late final String title;
  GroupCards({required this.title});
  @override
  State<StatefulWidget> createState() => _GroupCards();
}

class _GroupCards extends State<GroupCards> {
  _GroupCards();

  @override
  Widget build(BuildContext context) {
   
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            height: 95.0,
            width: 7.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            height: 95.0,
            width: MediaQuery.of(context).size.width - 22,
            decoration: BoxDecoration(
              border: Border(
                  //    right: BorderSide(
                  // color: Theme.of(context).colorScheme.secondary,
                  // )
                  ),

              /*   .all(color:Theme.of(context).colorScheme.secondary,width: 0.3,)
              color: Color.fromARGB(255, 0, 21, 40),*/
              /* borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
                
              ),*/
            ),
            child: Stack(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: TextStyle(
                         color:  Theme.of(context)
                                  .colorScheme
                                  .onSecondary,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 220,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
