import 'package:flutter/material.dart';
import 'package:for_beginners_531/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RepsTable extends StatefulWidget {
  @override
  _RepsTableState createState() => _RepsTableState();
}

class _RepsTableState extends State<RepsTable> {
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
      
              setState(() {})
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Week 1",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))),
            Table(
                border: TableBorder.all(
                    color: Colors.black26, width: 1, style: BorderStyle.solid),
                children: [
                  TableRow(children: [
                    TableCell(child: Center(child: Text('Day 1'))),
                    TableCell(child: Center(child: Text('Day 2'))),
                    TableCell(child: Center(child: Text('Day 3'))),
                  ]),
                  TableRow(children: [
                    TableCell(child: Center(child: Text('Squat'))),
                    TableCell(child: Center(child: Text('Deadlift'))),
                    TableCell(child: Center(child: Text('Bench Press'))),
                  ]),
                ]),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Table(
                  border: TableBorder.all(
                      color: Colors.black26,
                      width: 1,
                      style: BorderStyle.solid),
                  children: [
                    TableRow(children: [
                      TableCell(
                          child: Center(
                        child: Table(
                            border: TableBorder.all(
                                color: Colors.black26,
                                width: 1,
                                style: BorderStyle.solid),
                            children: [
                              TableRow(children: [
                                TableCell(child: Center(child: Text('Lbs'))),
                                TableCell(child: Center(child: Text('Sets'))),
                                TableCell(child: Center(child: Text('Reps'))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Center(
                                        child: Text(squat40.toString()))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Center(
                                        child: Text(squat50.toString()))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Center(
                                        child: Text(squat60.toString()))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Center(
                                        child: Text(squat65.toString()))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Center(
                                        child: Text(squat75.toString()))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Center(
                                        child: Text(squat85.toString()))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Center(
                                        child: Text(squat65.toString()))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                            ]),
                      )),
                      TableCell(
                          child: Center(
                        child: Table(
                            border: TableBorder.all(
                                color: Colors.black26,
                                width: 1,
                                style: BorderStyle.solid),
                            children: [
                              TableRow(children: [
                                TableCell(child: Center(child: Text('Lbs'))),
                                TableCell(child: Center(child: Text('Sets'))),
                                TableCell(child: Center(child: Text('Reps'))),
                              ]),
                              TableRow(children: [
                                TableCell(child: Center(child: Text('40'))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                            ]),
                      )),
                      TableCell(
                          child: Center(
                        child: Table(
                            border: TableBorder.all(
                                color: Colors.black26,
                                width: 1,
                                style: BorderStyle.solid),
                            children: [
                              TableRow(children: [
                                TableCell(child: Center(child: Text('Lbs'))),
                                TableCell(child: Center(child: Text('Sets'))),
                                TableCell(child: Center(child: Text('Reps'))),
                              ]),
                              TableRow(children: [
                                TableCell(child: Center(child: Text('40'))),
                                TableCell(child: Center(child: Text('1'))),
                                TableCell(child: Center(child: Text('5'))),
                              ]),
                            ]),
                      )),
                    ]),
                  ]),
            ),
          ])),
    );
  }
}
