import 'package:flutter/material.dart';
import 'package:hobbyhub/screens/authenticate/tutor_register.dart';
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
        appBar: AppBar(
          title: Text("Welcome!"),
          actions: <Widget>[
              FlatButton.icon(onPressed: ()async{
                  await _auth.signingOut();
                }, icon: Icon(Icons.person), label: Text("Logout")),

            FlatButton.icon(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );

              }, icon: Icon(Icons.add), label: Text("Add Help")),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Needs"),
              Tab(text: "Givers"),
              Tab(text: "Community"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ShowTutor(category: 'need'),
            givers(),
            Text("Hello"),
          ],
        ),
      ),
    );
  }
}
