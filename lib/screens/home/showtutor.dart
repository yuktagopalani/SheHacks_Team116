import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/Tutor.dart';
import 'package:hobbyhub/screens/home/need_list.dart';
//import 'package:hobbyhub/screens/home/tutor_list.dart';
import 'package:hobbyhub/services/database.dart';
import 'package:provider/provider.dart';
import 'package:hobbyhub/modules/need.dart';

class ShowTutor extends StatelessWidget {
  final category;
  ShowTutor({this.category});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Need>>.value(
      initialData: List(),
      value: DatabaseService(category: category).data,
      child: Scaffold(
        body: NeedList(),
      ),
    );
  }
}
