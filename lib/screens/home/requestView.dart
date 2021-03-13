import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
import 'package:hobbyhub/services/googlemaps.dart';
//class RequestView extends StatefulWidget {
//  Need need;
//  RequestView({this.need});
//  @override
//  _RequestViewState createState() => _RequestViewState(this.need);
//}
//
//class _RequestViewState extends State<RequestView> {
//  Need need;
//  _RequestVewState(Need need){
//    this.need=need;
//  }
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      children: [
//        Text("NAME: $widget.need.name"),
//      ],
//    );
//  }
//}


class RequestView extends StatelessWidget {
  Need need;
  RequestView({this.need});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help ${need.name}",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xff9ad7e9),
      ),
      body: Container(
        color:  Color(0xff9ad7e9),
        child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset("images/help.png",
                height: 150.0,
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Name : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),

                ),
                Text("${need.name}",
                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Need of : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),

                ),
                Text("${need.type}",
                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Mobile No. : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),

                ),
                Text("${need.contact}",
                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Address : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),

                ),
                Text("${need.address}",
                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),

//
//                ),
              child:  Card(
                color: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(55),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 25, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10.0),
                        top: Radius.circular(2.0)),
                  ),
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
                    title: Expanded(
                      child: Text("${need.description}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
//                    fontWeight: FontWeight.bold,

                          fontSize: 25.0,
                        ),
//                      ),
                    ),
                  ),
                ),
              )

          ),
//          RaisedButton(
//            child: Text("Reach ${need.name}"),
//              onPressed: (){
//              MapUtils.openMap(need.latitude, need.longitude);
//          }),
//          IconButton(icon: Icon(Icons.location_on_sharp,
//            color: Colors.lightBlue,
//            size: 50.0,
//          ), onPressed:(){
//            MapUtils.openMap(need.latitude, need.longitude);
//          })

        ],
      ),
      ),

    );
  }
}
