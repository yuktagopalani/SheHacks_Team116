import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
class ItemView extends StatelessWidget {
  final Need need;
  ItemView({this.need});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0),
        Text("${need.name} is in need of ${need.type}"),
        SizedBox(height: 10.0),
        Text("Location"),
      ],
    );
  }
}
