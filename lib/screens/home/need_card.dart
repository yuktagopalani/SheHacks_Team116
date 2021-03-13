import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
import 'package:hobbyhub/screens/home/itemview.dart';
import 'package:hobbyhub/screens/home/requestView.dart';

class NeedCard extends StatelessWidget {
  final Need need;
  NeedCard({this.need});
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      height: 180,
//      decoration: BoxDecoration(
//        gradient: LinearGradient(
//          begin: Alignment.topLeft,
//          end: Alignment.bottomLeft,
//          colors: [Colors.blue[100],Colors.white],
//        ),
//      ),
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
//          MapUtils.openMap(need.latitude, need.longitude);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestView(
                      need: need,
                    )),
          );
        },

          child: Card(
            color: Colors.blue[50],
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(55),



        ),
//              color: Colors.blue[100],



              child: ItemView(need: need),

          ),

      ),
    );
  }
}
