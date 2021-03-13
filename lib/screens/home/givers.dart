import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hobbyhub/screens/home/Women.dart';

class givers extends StatefulWidget {
  @override
  _giversState createState() => _giversState();
}

class _giversState extends State<givers> {
  var Category = [
    {"name": "Women", "image": "images/hobby.jpg"},
    {"name": "Orphan", "image": " images/Orp.png"},
    {"name": "Disabled", "image": " images/"},
    {"name": "Oldage", "image": " images/"},
    {"name": "Animals", "image": " images/"},
    {"name": " Poverty", "image": " images/"}
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFAvatar(
                        size: GFSize.LARGE,
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
