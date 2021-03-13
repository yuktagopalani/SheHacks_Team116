import 'package:flutter/material.dart';
import 'package:hobbyhub/screens/home/community.dart';
import 'package:hobbyhub/screens/home/givers.dart';
import 'package:hobbyhub/screens/home/profile.dart';
import 'package:hobbyhub/screens/home/showtutor.dart';
import 'package:hobbyhub/services/auth.dart';

class NewHome extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
//        backgroundColor: Color(0xff9ad7e9),
        appBar: AppBar(
          backgroundColor: Color(0xff9ad7e9),
//        backgroundColor: Colors.transparent,
          title: Text(
            "Welcome!",
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
                label: Text("My Needs")),
          ],
          bottom: TabBar(
//            labelColor: Colors.purple[100],

          indicatorColor:  Colors.lightBlue,
            tabs: [

              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Needs",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Blogs",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Community",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.blue[200],Colors.blue[50]],
            ),
          ),
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
