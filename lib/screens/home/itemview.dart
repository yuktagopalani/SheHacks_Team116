import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
import 'package:hobbyhub/services/googlemaps.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
class ItemView extends StatelessWidget {
  final Need need;
  ItemView({this.need});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//        Container(
//          height: 30.0,
//          child: Image.asset('images/heartsymbol.png',
//          ),
//        ),

        SizedBox(height: 20.0),
//        Expanded(
//          child:
          Expanded(
            child: Text("${need.name} is in need of ${need.type}",
            style: TextStyle(
//              fontWeight: FontWeight.bold,
                fontSize: 20.0,
//            color: Colors.purple,
            ),),
          ),
//        ),

        Row(
          children: <Widget>[
            SizedBox(
              width: 120.0,
            ),
           GestureDetector(
            onTap: (){
              MapUtils.openMap(need.latitude, need.longitude);
            },
             child: Icon(Icons.location_on_sharp,
               color: Colors.lightBlue,
               size: 40.0,
             ),

//              child: Text("Location",
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 25.0,
//                  color: Colors.purple[300],
//                ),
//              )
          ),
            SizedBox(
              width: 50.0,
            ),
            IconButton(
              icon: Icon(
                Icons.call,
                color: Colors.lightBlue,
                size: 40.0,
              ),
              onPressed: (){
                UrlLauncher.launch(('tel://${need.contact}'));
              },
            ),
          ],
        ),
                SizedBox(height: 30.0),
      ],
    );
  }
}
