import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hobbyhub/modules/user.dart';
import 'package:hobbyhub/screens/authenticate/register.dart';
import 'package:hobbyhub/screens/authenticate/tutor_register.dart';
import 'package:hobbyhub/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/home/wrapper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
