import 'package:flutter/material.dart';
import 'package:hobbyhub/services/auth.dart';
import 'package:hobbyhub/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading=false;
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Stack(
      children: <Widget>[
      Image.asset(
      "images/back.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 50.0,
          title: Text(""),
          actions: <Widget>[
            FlatButton.icon(
          icon: Icon(Icons.person), label: Text("Register"),
          onPressed: ()async{
            widget.toggleView();
          }, ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an E-Mail' : null,
                  onChanged: (val){
                    setState(() => email=val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  validator: (val) => val.length <6 ? 'Password should be at least 6 characters' : null,
                  onChanged: (val){
                    setState(() => password=val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text("Sign in"),
                    onPressed: ()async{
                      if(_formkey.currentState.validate())
                      {
                        setState(() => loading=true);
                        dynamic result = await _auth.signInWithEmail(email, password);
                        if(result==null)
                        {
                          setState(() => error='Incorrect Credentials');
                          loading=false;
                        }
                      }

                    }),
                SizedBox(height: 20.0),
                Text(error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
  ],
    );
  }
}
