import 'package:flutter/material.dart';
import 'package:hobbyhub/screens/home/categorydetails.dart';

class givers extends StatefulWidget {
  @override
  _giversState createState() => _giversState();
}

class _giversState extends State<givers> {
  var Category = [
    {
      "name": "Cloths",
    },
    {
      "name": "Books",
    },
    {
      "name": "Medicines",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: Category.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(4.0),
          child: cat(
            spcategory: Category[index]['name'],
          ),
        );
      },
    );
  }
}

class cat extends StatelessWidget {
  final spcategory;

  cat({this.spcategory});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: Center(
          child: Column(children: [
            Text(spcategory),
            RaisedButton(
              color: Colors.blue[400],
              child: GridTile(
                child: Text(" Donate"),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        categorydetails(category: spcategory)));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
