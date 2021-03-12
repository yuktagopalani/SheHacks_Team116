import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
import 'package:hobbyhub/services/googlemaps.dart';
class ItemView extends StatelessWidget {
  final Need need;
  ItemView({this.need});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
//        Expanded(
//          child:
          Text("${need.name} is in need of ${need.type}",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
          ),),
//        ),
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            SizedBox(
              width: 50.0,
            ),
           GestureDetector(
            onTap: (){
              MapUtils.openMap(need.latitude, need.longitude);
            },
              child: Text("Location",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.blue,
                ),
              )
          ),
            SizedBox(
              width: 50.0,
            ),
            Icon(
              Icons.call,
              color: Colors.blue,
              size: 30.0,
            ),
          ],
        ),
      ],
    );
  }
}
