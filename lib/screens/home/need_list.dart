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
    return Container(
            decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [Colors.blue[200],Colors.blue[50]],
        ),
      ),
//      color: Color(0xff9ad7e9),
      child: ListView.builder(
          itemCount: needs.length,
          itemBuilder: (context,index){
        return Column(
          children: [
            NeedCard(need: needs[index]),
          ],
        );
      },
      ),
    );
  }
}
