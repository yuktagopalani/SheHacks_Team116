import 'package:flutter/material.dart';
import 'package:hobbyhub/screens/home/newhome.dart';
import 'package:provider/provider.dart';
import 'package:hobbyhub/modules/user.dart';
import 'package:hobbyhub/screens/authenticate/authenticate.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user  = Provider.of<MyUser>(context);
    if(user==null)
    {
      return Authenticate();
    }
    else{
      return NewHome();
    }
  }
}
