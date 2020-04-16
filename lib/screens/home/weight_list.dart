import 'package:flutter/material.dart';
import 'package:for_beginners_531/screens/home/weight_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_beginners_531/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:for_beginners_531/models/weight.dart';

class WeightList extends StatefulWidget {
  @override
  _WeightListState createState() => _WeightListState();
}

class _WeightListState extends State<WeightList> {
  String uid;

  int squat = -1;
  int bench = -1;
  int deadlift = -1;
  int press = -1;

  @override
  void initState() {
    super.initState();
    getUid();
  }

  getUid() async {
    await AuthService().uid.then((result) => {
          uid = result,
          print("test $uid"),
          getWeights(),
        });
  }

  getWeights() async {
    Firestore.instance
        .collection('weights')
        .document(uid)
        .get()
        .then((DocumentSnapshot docs) => {
              squat = docs['squat'],
              bench = docs['bench'],
              deadlift = docs['deadlift'],
              press = docs['press'],
              setState(() {})
            });
  }

  @override
  Widget build(BuildContext context) {
    if (uid == null) {
      return Container();
    }

    return ListView(
      children: <Widget>[
        WeightTile(weight: squat, name: "Squat"),
        WeightTile(weight: bench, name: "Bench Press"),
        WeightTile(weight: deadlift, name: "Dead Lift"),
        WeightTile(weight: press, name: "Overhead Press"),
      ],
    );
  }
}
