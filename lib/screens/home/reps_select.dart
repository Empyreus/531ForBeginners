import 'package:flutter/material.dart';
import 'package:for_beginners_531/screens/weights/week1/bench_screen.dart';
import 'package:for_beginners_531/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_beginners_531/models/custom_datatable.dart';
import 'package:for_beginners_531/screens/weights/week1/squat_screen.dart';

class RepsSelect extends StatefulWidget {
  @override
  _RepsSelectState createState() => _RepsSelectState();
}

class _RepsSelectState extends State<RepsSelect> {
  String uid;

  int squat = -1;
  int bench = -1;
  int deadlift = -1;
  int press = -1;

  // Init Squats
  int squat40;
  int squat50;
  int squat60;
  int squat65;
  int squat70;
  int squat75;
  int squat80;
  int squat85;
  int squat90;
  int squat95;

  // Init bench
  int bench40;
  int bench50;
  int bench60;
  int bench65;
  int bench70;
  int bench75;
  int bench80;
  int bench85;
  int bench90;
  int bench95;

  // Init deadlift
  int deadlift40;
  int deadlift50;
  int deadlift60;
  int deadlift65;
  int deadlift70;
  int deadlift75;
  int deadlift80;
  int deadlift85;
  int deadlift90;
  int deadlift95;

  // Init press
  int press40;
  int press50;
  int press60;
  int press65;
  int press70;
  int press75;
  int press80;
  int press85;
  int press90;
  int press95;

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
              // Squat Calculations
              squat40 = (((squat * .40) * .90) / 5).round() * 5,
              squat50 = (((squat * .50) * .90) / 5).round() * 5,
              squat60 = (((squat * .60) * .90) / 5).round() * 5,
              squat65 = (((squat * .65) * .90) / 5).round() * 5,
              squat70 = (((squat * .70) * .90) / 5).round() * 5,
              squat75 = (((squat * .75) * .90) / 5).round() * 5,
              squat80 = (((squat * .80) * .90) / 5).round() * 5,
              squat85 = (((squat * .85) * .90) / 5).round() * 5,
              squat90 = (((squat * .90) * .90) / 5).round() * 5,
              squat95 = (((squat * .95) * .90) / 5).round() * 5,
              // Bench Calculations
              bench40 = (((bench * .40) * .90) / 5).round() * 5,
              bench50 = (((bench * .50) * .90) / 5).round() * 5,
              bench60 = (((bench * .60) * .90) / 5).round() * 5,
              bench65 = (((bench * .65) * .90) / 5).round() * 5,
              bench70 = (((bench * .70) * .90) / 5).round() * 5,
              bench75 = (((bench * .75) * .90) / 5).round() * 5,
              bench80 = (((bench * .80) * .90) / 5).round() * 5,
              bench85 = (((bench * .85) * .90) / 5).round() * 5,
              bench90 = (((bench * .90) * .90) / 5).round() * 5,
              bench95 = (((bench * .95) * .90) / 5).round() * 5,

              // Deadlift Calculations
              deadlift40 = (((deadlift * .40) * .90) / 5).round() * 5,
              deadlift50 = (((deadlift * .50) * .90) / 5).round() * 5,
              deadlift60 = (((deadlift * .60) * .90) / 5).round() * 5,
              deadlift65 = (((deadlift * .65) * .90) / 5).round() * 5,
              deadlift70 = (((deadlift * .70) * .90) / 5).round() * 5,
              deadlift75 = (((deadlift * .75) * .90) / 5).round() * 5,
              deadlift80 = (((deadlift * .80) * .90) / 5).round() * 5,
              deadlift85 = (((deadlift * .85) * .90) / 5).round() * 5,
              deadlift90 = (((deadlift * .90) * .90) / 5).round() * 5,
              deadlift95 = (((deadlift * .95) * .90) / 5).round() * 5,

              // Press Calculations
              press40 = (((press * .40) * .90) / 5).round() * 5,
              press50 = (((press * .50) * .90) / 5).round() * 5,
              press60 = (((press * .60) * .90) / 5).round() * 5,
              press65 = (((press * .65) * .90) / 5).round() * 5,
              press70 = (((press * .70) * .90) / 5).round() * 5,
              press75 = (((press * .75) * .90) / 5).round() * 5,
              press80 = (((press * .80) * .90) / 5).round() * 5,
              press85 = (((press * .85) * .90) / 5).round() * 5,
              press90 = (((press * .90) * .90) / 5).round() * 5,
              press95 = (((press * .95) * .90) / 5).round() * 5,
              setState(() {})
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
          Center(
              child: Text(
            'Week 1',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          GridView.count(
            childAspectRatio: 2,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SquatTableScreen(uid: uid)),
                            );
                          },
                          child: Center(
                            child: Text("Squat"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {},
                          child: Center(
                            child: Text("Deadlift"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {},
                          child: Center(
                            child: Text("Bench"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              )
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BenchTableScreen(uid: uid)),
                            );
                          },
                          child: Center(
                            child: Text("Bench"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {},
                          child: Center(
                            child: Text("Deadlift"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {},
                          child: Center(
                            child: Text("Bench"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              )
            ],
          )
        ]),
      ),
    );
  }
}
