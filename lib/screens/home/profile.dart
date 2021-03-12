import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
import 'package:hobbyhub/screens/authenticate/tutor_register.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  String uid;
  List<Need> list = [];

  @override
  void getuser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    this.uid = user.uid;
  }
  //
  // void getdata() async {
  //   final CollectionReference temp =
  //       FirebaseFirestore.instance.collection("need");
  //   await temp.get().then((QuerySnapshot snapshot) {
  //     snapshot.docs.forEach((f) {
  //       print(f.data());
  //       var tp = f.data();
  //       String name = tp["name"];
  //       String type = tp["type"];
  //       String description = tp["description"];
  //       String address = tp["address"];
  //       String contact = tp["contact"];
  //       double latitude = tp["latitude"];
  //       double longitude = tp["longitude"];
  //       String ud = tp["uid"];
  //       print(name);
  //       if (ud == uid)
  //         list.add(Need(
  //             name: name,
  //             address: address,
  //             type: type,
  //             description: description,
  //             contact: contact,
  //             uid: uid,
  //             latitude: latitude,
  //             longitude: longitude));
  //       //Adding value to your Need list
  //     });
  //   });
  //   print(list.length);
  //   print(list[0].type);
  // }

  void initState() {
    // TODO: implement initState
    getuser();
    print(uid);
//    DatabaseService databaseService = new DatabaseService(category: 'need');
//    list = DatabaseService(category: 'need').needListFromSnapshot(FirebaseFirestore.instance
//        .collection('need')
//        .snapshots());
//    list = lis.toList();
//     getdata();
//     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9D44B8),
          title: Text(" "),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {},
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
          stream: FirebaseFirestore.instance.collection('need').snapshots(),
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
                      child: Center(child: Text(document['type'])),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TutorRegister()),
              );

              // action on button press
            })
    );
    ;
  }
}

// class ListItem extends StatelessWidget {
//   String name = '';
//   String contact = '';
//   String type = '';
//   String description = '';
//   String address = '';
//   double lat = 0.0;
//   double long = 0.0;
//   String uid = "";
//   ListItem(
//       {this.name,
//       this.contact,
//       this.type,
//       this.description,
//       this.address,
//       this.lat,
//       this.long,
//       this.uid});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
//       height: 220,
//       width: double.maxFinite,
//       child: Card(
//         elevation: 5,
//         color: Theme.of(context).cardColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(10.0), top: Radius.circular(2.0)),
//         ),
//         child: Text(type),
//       ),
//     );
//   }
// }
