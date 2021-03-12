import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/need.dart';
import 'package:provider/provider.dart';
import 'package:hobbyhub/screens/home/need_card.dart';
class NeedList extends StatefulWidget {
  @override
  _NeedListState createState() => _NeedListState();
}
class _NeedListState extends State<NeedList> {
  @override
  Widget build(BuildContext context) {
    final needs=Provider.of<List<Need>>(context);
    return ListView.builder(
        itemCount: needs.length,
        itemBuilder: (context,index){
      return NeedCard(need: needs[index]);
    },
    );
  }
}
