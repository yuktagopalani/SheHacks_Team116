import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class HelpDetail extends StatefulWidget {
  @override
  HelpDetailState createState() => new HelpDetailState();
}

class HelpDetailState extends State<HelpDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9ad7e9),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: AssetImage('assets/images/donate.png'),
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Text(
                  'Name : Hi, I am Amelie. I have been stuck in my home since last 10 days due to ......',
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/affection.png"),
                    title: Text(''),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    // subtitle: Text('Play these games to improve your focus'),
                    // isThreeLine: true,
                    trailing: RaisedButton(
                      child: Text('Send help'),
                      color: Colors.pink[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.black)),
                      onPressed: (null),
                    ),
                  ),
                  color: Colors.blue[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          // add form here
        ],
      ),
    );
  }
}