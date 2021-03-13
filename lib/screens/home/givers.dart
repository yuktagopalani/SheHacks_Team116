import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hobbyhub/screens/home/Women.dart';

class givers extends StatefulWidget {
  @override
  _giversState createState() => _giversState();
}

class _giversState extends State<givers> {
  var Category = [
    {"name": "Women", "image": "images/woman.png"},
    {"name": "Orphan", "image": "images/dan.png"},
    {"name": "Disabled", "image": "images/cha.png"},
    {"name": "Oldage", "image": "images/old.png"},
    {"name": "Animals", "image": "images/affection.png"},
    {"name": " Poverty", "image": "images/helpme.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        itemCount: Category.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(
              10.0,
            ),
            child: cat(
              spcategory: Category[index]['name'],
              Image: Category[index]['image'],
            ),
          );
        },
      ),
    );
  }
}

class cat extends StatelessWidget {
  final spcategory;
  final Image;

  cat({this.spcategory, this.Image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Women()));
        },
        child: Center(
          child: Card(
            color: Colors.blue[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFAvatar(
                        size: GFSize.LARGE,
                        radius: 50,
                        foregroundColor: Colors.black,
                        backgroundImage: AssetImage(Image),
                        shape: GFAvatarShape.circle),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      spcategory,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9D44B8),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
    // Card(
    //   child: Material(
    //     child: Center(
    //       child: Column(children: [
    //         Text(spcategory),
    //         RaisedButton(
    //           color: Colors.blue[400],
    //           child: GridTile(
    //             child: Text(" Donate"),
    //           ),
    //           onPressed: () {
    //             Navigator.of(context).push(MaterialPageRoute(
    //                 builder: (context) =>
    //                     categorydetails(category: spcategory)));
    //           },
    //         ),
    //       ]),
    //     ),
    //   ),
    // );
  }
}
