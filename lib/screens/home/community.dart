import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  EventsState createState() => new EventsState();
}

var ear = '\u1F30D';

class EventsState extends State<Events> {
  double screenHeight;
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Event event = Event(
      title: 'Plant a tree in every 2 months',
      description: 'Plant a tree in every 2 months for the green India',
//      location: 'Lucknow',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 1)),
      allDay: false,
    );
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
//      backgroundColor: Color(0xff9ad7e9),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[200],Colors.blue[50]],
          ),
        ),

        child: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: new Container(
              child: new Center(
                child: Column(
                  children: <Widget>[
//                    SizedBox(
//                      height: 30,
//                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                          image: AssetImage('images/earth.png'),
                          height: 200,
                          width: 200,
                        ),
//                        SizedBox(
//                          height: 5,
//                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Text(
                            '',
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: ListTile(
                              leading: Image.asset("images/1056844.png"),
                              title: Text('Plant a tree'),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
//                              subtitle: Text(''),
//                              isThreeLine: true,
                              trailing: RaisedButton(
                                child: Text('Add'),
                                color: Colors.pink[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Add2Calendar.addEvent2Cal(event)
                                      .then((success) {
                                    scaffoldState.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(success
                                                ? 'Success'
                                                : 'Error')));
                                  });
                                },
                              ),
                            ),
                            color: Colors.blue[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Card(
                            child: ListTile(
                              leading: Container(
//                                height: 10.0,
                                width: 50.0,
                                child: Image.asset(
                                  "images/bicycle.png",
                                ),
                              ),
                              title: Text('Use Bicycle'),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
//                              subtitle: Text('Give Up cars and use bicycle for one in a month'),
//                              isThreeLine: true,
                              trailing: RaisedButton(
                                child: Text('Add'),
                                color: Colors.pink[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Add2Calendar.addEvent2Cal(event)
                                      .then((success) {
                                    scaffoldState.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(success
                                                ? 'Success'
                                                : 'Error')));
                                  });
                                },
                              ),
                            ),
                            color: Colors.blue[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Card(
                            child: ListTile(
                              leading: Image.asset("images/marathon.png"),
                              title: Text('Participate in Marathon'),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              trailing: RaisedButton(
                                child: Text('Add'),
                                color: Colors.pink[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Add2Calendar.addEvent2Cal(event)
                                      .then((success) {
                                    scaffoldState.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(success
                                                ? 'Success'
                                                : 'Error')));
                                  });
                                },
                              ),
                            ),
                            color: Colors.blue[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Card(
                            child: ListTile(
                              leading: Image.asset("images/blood.png"),
                              title: Text('Donate blood'),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              trailing: RaisedButton(
                                child: Text('Add'),
                                color: Colors.pink[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Add2Calendar.addEvent2Cal(event)
                                      .then((success) {
                                    scaffoldState.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(success
                                                ? 'Success'
                                                : 'Error')));
                                  });
                                },
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
