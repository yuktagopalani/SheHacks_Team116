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
          backgroundColor: Color(0xff9ad7e9),
          title: Text(" "),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: ()async{
                  await _aut.signingOut();
                },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              label: Text(
                "Log Out",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.blue[200],Colors.blue[50]],
            ),
          ),
          child: StreamBuilder(
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
                            color: Colors.lightBlue,
                          ),
                          Text(this.email,
                            style: TextStyle(
//                            color: Color(0xff9ad7e9),
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
                    RaisedButton(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Need Help ?',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      color: Colors.pink[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TutorRegister()),
                        );

                      },
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
                    Card(
                      color: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      ),
                      child: ListTile(
//                    selectedTileColor: ,
//                    color: Color(0xffE3CAEA),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        leading: IconButton(
                            color: Colors.lightBlue,
                          icon:  Icon(Icons.remove_red_eye,
                            size: 35.0,
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RequestView(need: Need(name: document["name"],type: document["type"],description: document["description"],contact: document["contact"],address: document["address"],longitude: document["longitude"],latitude: document["latitude"],uid: document["uid"]))),
                            );
                              }
                        ),
//
                        title: Text(document['type'],
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        trailing: IconButton(
                            color: Colors.lightBlue,
                            icon:  Icon(Icons.delete,
                              size: 35.0,
                            ),
                            onPressed: (){
                                        setState(() {
                                          deleteUser(document.id);
                                        });

                            }
                        ),

                      ),
                    ),
                  ]) : Container();
                }).toList(),
              );
            },
          ),
        ),

    );

  }
}

