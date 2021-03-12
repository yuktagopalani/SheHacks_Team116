import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
import 'package:hobbyhub/screens/home/itemview.dart';
import 'package:hobbyhub/services/googlemaps.dart';
import 'package:hobbyhub/screens/home/requestView.dart';
class NeedCard extends StatelessWidget {
  final Need need;
  NeedCard({this.need});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      height: 220,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: (){
//          MapUtils.openMap(need.latitude, need.longitude);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RequestView(need: need,)),
          );

        },
        child: Card(
          elevation: 5,
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10.0),
                top: Radius.circular(2.0)),
          ),
          child: ItemView(need: need),
        ),
      ),
    );
  }
}
