import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
import 'package:hobbyhub/screens/authenticate/tutor_register.dart';
import 'package:hobbyhub/shared/loading.dart';
import 'requestView.dart';
import 'package:hobbyhub/services/auth.dart';


class Profile extends StatefulWidget {
//  final Need need;
////  Profile({this.need});
//  Profile({ Key key, this.need }): super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _aut = AuthService();
  User user;
  String uid;
  String email='';
  List<Need> list = [];


  @override
  void getuser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    this.uid = user.uid;
    this.email=user.email;

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
  CollectionReference ref = FirebaseFirestore.instance.collection('need');

  Future<void> deleteUser(String id) {
    return ref
        .doc(id)
        .delete()
        .then((value) => print("Need Deleted"))
        .catchError((error) => print("Failed to delete need: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9D44B8),
          title: Text(" "),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: ()async{
                  await _aut.signingOut();
                },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text(
                "Log Out",
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
                child: Loading(),
              );
            }

            return ListView(
              children: snapshot.data.docs.map((document) {
//                String
                return document['uid']==this.uid ?Column(children: [
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: 200.0,
                          color: Color(0xff9D44B8) ,
                        ),
                        Text(this.email,
                          style: TextStyle(
                            color: Color(0xff9D44B8) ,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Your Needs ",
                    style: TextStyle(
//                      color: Color(0xff9D44B8) ,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
//                    selectedTileColor: ,
//                    color: Color(0xffE3CAEA),
                    leading: IconButton(
                      icon:  Icon(Icons.preview),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RequestView(need: Need(name: document["name"],type: document["type"],description: document["description"],contact: document["contact"],address: document["address"],longitude: document["longitude"],latitude: document["latitude"],uid: document["uid"]))),
                        );
                          }
                    ),
//
                    title: Text(document['type']),
                    trailing: GestureDetector(child: Text("Mark as Done"),
                      onTap: (){
                                    setState(() {
                                      deleteUser(document.id);
                                    });
                      },
                    ),
                  ),
//                  Container(
//                    padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
//                    height: 120,
//                    width: double.maxFinite,
//                    child: GestureDetector(
//                      onTap: (){
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => RequestView(need: need,)),
//                        );
//                      },
//                      child: Card(
////                      title: Text(document['type']),
////                      subtitle: Icon(Icons.delete),
//                        color: Color(0xffE3CAEA),
//                        elevation: 14,
//                        child: ListTile(title:Text(document['type']) ,
//                          subtitle: Row(
//                            children: [
//                              SizedBox(
//                                width: 150.0,
//                              ),
//                              Container(
//                                width: 150.0,
////                                  height: 10,
//                                child: RaisedButton(
//                                  onPressed: (){
//                                    setState(() {
//                                      deleteUser(document.id);
//                                    });
//                                  },
//                                  elevation: 5.0,
//                                  color: Colors.blue,
//                                  child: Padding(
//                                    padding: const EdgeInsets.all(8.0),
//
//                                    child: Text("Mark As Done"),
//                                  ),
//                                ),
//                              ),
////                                Icon(Icons.)
//
//                            ],
//                          ),
//                        )
//
////                      Center(child: Text(document['type'])),
//                      ),
//                    ),
//                  ),
                ]) : Container();
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
