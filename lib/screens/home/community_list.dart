import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/community.dart';
import 'package:provider/provider.dart';
class CommunityList extends StatefulWidget {
  @override
  _CommunityListState createState() => _CommunityListState();
}

class _CommunityListState extends State<CommunityList> {
  @override
  Widget build(BuildContext context) {
    final community=Provider.of<List<Community>>(context);
    return Container();
  }
}
