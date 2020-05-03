import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SquatTable extends StatefulWidget {
  SquatTable({this.uid});

  final String uid;

  @override
  _SquatTableState createState() => _SquatTableState();
}

class _SquatTableState extends State<SquatTable> {
  int squat = -1;

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

  @override
  void initState() {
    super.initState();
    getWeights();
  }

  getWeights() async {
    Firestore.instance
        .collection('weights')
        .document(widget.uid)
        .get()
        .then((DocumentSnapshot docs) => {
              squat = docs['squat'],
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
            'Squat',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          DataTable(columns: [
            DataColumn(
                label: Text(
              'lbs',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'sets',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'reps',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
          ], rows: [
            DataRow(cells: [
              DataCell(Text(squat40.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(squat50.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(squat60.toString())),
              DataCell(Text('1')),
              DataCell(Text('3')),
            ]),
            DataRow(cells: [
              DataCell(Text(squat70.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(squat80.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(squat90.toString())),
              DataCell(Text('1')),
              DataCell(Text('5+')),
            ]),
            DataRow(cells: [
              DataCell(Text(squat70.toString())),
              DataCell(Text('5')),
              DataCell(Text('5')),
            ]),
          ]),
        ]),
      ),
    );
  }
}
