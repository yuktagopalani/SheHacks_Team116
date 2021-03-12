import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class categorydetails extends StatelessWidget {
  final category;
  categorydetails({this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(" "),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              FirebaseFirestore.instance.collection(category).add({
                'desc': 'I want to denoate ' + category,
                'latitude': '00',
                'longitude': "00"
              });
            },
            icon: Icon(Icons.add),
            label: Text("add data"),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(category).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.docs.map((document) {
              return Card(
                elevation: 34,
                child: Center(child: Text(document['desc'])),
              );
            }).toList(),
          );
        },
      ),
    );
    ;
  }
}
