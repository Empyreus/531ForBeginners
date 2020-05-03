import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeadliftTable extends StatefulWidget {
  DeadliftTable({this.uid});

  final String uid;

  @override
  _DeadliftTableState createState() => _DeadliftTableState();
}

class _DeadliftTableState extends State<DeadliftTable> {
  int deadlift = -1;

  // Init Deadlifts
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
              deadlift = docs['deadlift'],
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
            'Deadlift',
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
              DataCell(Text(deadlift40.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(deadlift50.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(deadlift60.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(deadlift75.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(deadlift85.toString())),
              DataCell(Text('1')),
              DataCell(Text('3')),
            ]),
            DataRow(cells: [
              DataCell(Text(deadlift95.toString())),
              DataCell(Text('1')),
              DataCell(Text('1+')),
            ]),
            DataRow(cells: [
              DataCell(Text(deadlift75.toString())),
              DataCell(Text('5')),
              DataCell(Text('5')),
            ]),
          ]),
        ]),
      ),
    );
  }
}
