import 'package:flutter/material.dart';
import 'package:for_beginners_531/authentication.dart';
import 'package:for_beginners_531/database.dart';
import 'package:for_beginners_531/home/weight_list.dart';
import 'package:provider/provider.dart';
import 'package:for_beginners_531/models/weight.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Weight>>.value(
      value: DatabaseService().weights,
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Flutter login demo'),
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Logout',
                      style:
                          new TextStyle(fontSize: 17.0, color: Colors.white)),
                  onPressed: signOut)
            ],
          ),
          body: WeightList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          )),
    );
  }
}
