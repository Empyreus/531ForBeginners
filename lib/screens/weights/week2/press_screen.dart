import 'package:for_beginners_531/screens/home/reps_select.dart';
import 'package:for_beginners_531/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:for_beginners_531/services/database.dart';
import 'package:provider/provider.dart';
import 'package:for_beginners_531/models/weight.dart';
import 'package:for_beginners_531/screens/weights/week2/press_table.dart';

class Week2PressTableScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  Week2PressTableScreen({this.uid});
  final String uid;


  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Weight>>.value(
      value: DatabaseService().weights,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: Text('531 For Beginners'),
            backgroundColor: Colors.blueGrey[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: PressTable(uid: uid)),
    );
  }
}
