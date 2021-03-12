import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Categoryform extends StatefulWidget {
  final category;
  Categoryform({this.category});
  @override
  _CategoryformState createState() => _CategoryformState();
}

class _CategoryformState extends State<Categoryform> {
  var _formKey = GlobalKey<FormState>();
  String name;
  String desc;
  String location;
  var isLoading = false;
  @override
  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Help the needy One ",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  name = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Name';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input
              TextFormField(
                decoration: InputDecoration(labelText: 'desc'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  desc = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter decription';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() => desc = val);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'location'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  location = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter location';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() => location = val);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () {
                  FirebaseFirestore.instance.collection(widget.category).add({
                    'Name': name,
                    'desc': desc,
                    'location': location,
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
