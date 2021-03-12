import 'package:flutter/material.dart';
import 'package:hobbyhub/screens/home/newhome.dart';
import 'package:hobbyhub/services/auth.dart';
import 'package:hobbyhub/services/database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hobbyhub/services/location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class TutorRegister extends StatefulWidget {
  @override
  _TutorRegisterState createState() => _TutorRegisterState();
}

class _TutorRegisterState extends State<TutorRegister> {
  String uid="";

  AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String name='';
  String contact='';
  String type='';
  String description='';
  String address='';
  String error='';
  Location location = new Location();
  double lat=0.0;
  double long=0.0;
  void getuser() async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    this.uid = user.uid;
  }
  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    getuser();
//    print(lat);
//    print(long);
    super.initState();
  }
  Future<void> getLocation() async
  {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      this.lat=position.latitude;
      this.long=position.longitude;
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy to Help!"),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: 'Name',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter Name' : null,
                  onChanged: (val){
                    setState(() => name=val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: 'Contact Number',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter Contact Number' : null,
                  onChanged: (val){
                    setState(() => contact=val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: 'Your Need',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter your need' : null,
                  onChanged: (val){
                    setState(() => type=val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: 'Description',
                  ),
                  validator: (val) => val.isEmpty ? 'Add a description' : null,
                  onChanged: (val){
                    setState(() => description=val);
                  },
                ),


                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: 'Address',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter your Address' : null,
                  onChanged: (val){
                    setState(() => address=val);
                  },
                ),
                SizedBox(height: 20.0),
//                ElevatedButton(
//                    child: Text("Location"),
//                    onPressed:()async{
//                  await getLocation();
//
//
//                }),

                ElevatedButton(
//                    color: Colors.pink[400],
                    child: Text("Add Help"),
                    onPressed: ()async{
                        await DatabaseService(category: 'need').addHelp(name, contact, type, address, description, lat, long,uid);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewHome()));

                    }),
                SizedBox(height: 20.0),
                Text(error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),

        ],
//        child: Container(
//          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
//          child:
//        ),
      ),
    );
  }
}
