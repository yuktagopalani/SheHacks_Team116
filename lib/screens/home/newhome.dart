import 'package:flutter/material.dart';
import 'package:hobbyhub/screens/home/givers.dart';
import 'package:hobbyhub/screens/home/profile.dart';
import 'package:hobbyhub/screens/home/showtutor.dart';
import 'package:hobbyhub/screens/home/test.dart';
import 'package:hobbyhub/services/auth.dart';
import 'package:hobbyhub/screens/home/community.dart';

class NewHome extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9ad7e9),
          title: Text("Welcome!",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
//              FlatButton.icon(onPressed: ()async{
//                  await _auth.signingOut();
//                }, icon: Icon(Icons.person), label: Text("Logout")),


//            FlatButton.icon(onPressed: (){
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => Profile()),
//              );
//
//              }, icon: Icon(Icons.person,color: Colors.white,), label: Text("Profile",style: TextStyle(color: Colors.white),),),

            FlatButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                icon: Icon(Icons.person),
                label: Text("Profile")),

          ],
          bottom: TabBar(
//            labelColor: Colors.purple[100],
          indicatorColor: Colors.purple[100],
            tabs: [

              Tab(text: "Needs"),
              Tab(text: "Society"),

              Tab(text: "Community"),
            ],
          ),
        ),
        body: Container(
//          color: Colors.purple[100],
          child: TabBarView(

            children: [
              ShowTutor(category: 'need'),
              givers(),
              Events(),
            ],
          ),
        ),
      ),
    );
  }
}
