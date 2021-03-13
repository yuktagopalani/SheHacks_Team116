import 'package:flutter/material.dart';
import 'package:hobbyhub/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9ad7e9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 50.0,
        title: Text(""),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () async {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Text(
                  "AID CHANGE",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
                Image(
                  image: AssetImage('images/helpme.png'),
                  height: 300,
                  width: 400,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "E-Mail:",
                    fillColor: Colors.pink[100],
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an E-Mail' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Password :",
                    fillColor: Colors.pink[100],
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  obscureText: true,
                  validator: (val) => val.length < 6
                      ? 'Password should be at least 6 characters'
                      : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text("Sign in"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: Colors.black)),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        setState(() => loading = true);
                        dynamic result =
                        await _auth.signInWithEmail(email, password);
                        if (result == null) {
                          setState(() => error = 'Incorrect Credentials');
                          loading = false;
                        }
                      }
                    }),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}