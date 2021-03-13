import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hobbyhub/screens/home/Categoryform.dart';

class categorydetails extends StatelessWidget {
  final category;
  categorydetails({this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9D44B8),
          title: Text(" "),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                "profile",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(category).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data.docs.map((document) {
                return Column(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      color: Color(0xffE3CAEA),
                      elevation: 34,
                      child: Center(child: Text(document['desc'])),
                    ),
                  ),
                ]);
              }).toList(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff9D44B8),
            elevation: 10.0,
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Categoryform(category: category)));
              // action on button press
            }));
  }
}
