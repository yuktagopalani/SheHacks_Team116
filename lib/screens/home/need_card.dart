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

              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(55),


//=======
//        child: Card(
//          elevation: 5,
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.vertical(
//                bottom: Radius.circular(10.0), top: Radius.circular(2.0)),
//          ),
//          child: ItemView(need: need),
//>>>>>>> 2d3cea98f15b7439d7580feda180bfce0098408b
        ),
//              color: Colors.blue[100],



              child: ItemView(need: need),

          ),
//        child: Card(
//          child: ListTile(
//            leading: IconButton()
//
//            title: Text('Looking for shelter...'),
//            contentPadding: EdgeInsets.symmetric(
//                horizontal: 25, vertical: 20),
//            subtitle: Text('Location : Kerala'),
//            isThreeLine: true,
//            trailing: RaisedButton(
//              child: Text('More'),
//              color: Colors.pink[100],
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(18),
//                  side: BorderSide(color: Colors.black)),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) =>
//                            HelpDetail()));
//              },
//            ),
//          ),
//          color: Colors.blue[100],
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(55),
//          ),
//        ),
      ),
    );
  }
}
