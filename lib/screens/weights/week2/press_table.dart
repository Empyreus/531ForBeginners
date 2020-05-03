import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PressTable extends StatefulWidget {
  PressTable({this.uid});

  final String uid;

  @override
  _PressTableState createState() => _PressTableState();
}

class _PressTableState extends State<PressTable> {
  int press = -1;

  // Init Presss
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
    getWeights();
  }

  getWeights() async {
    Firestore.instance
        .collection('weights')
        .document(widget.uid)
        .get()
        .then((DocumentSnapshot docs) => {
              press = docs['press'],
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
            'Press',
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
              DataCell(Text(press40.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(press50.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(press60.toString())),
              DataCell(Text('1')),
              DataCell(Text('3')),
            ]),
            DataRow(cells: [
              DataCell(Text(press70.toString())),
              DataCell(Text('1')),
              DataCell(Text('3')),
            ]),
            DataRow(cells: [
              DataCell(Text(press80.toString())),
              DataCell(Text('1')),
              DataCell(Text('3')),
            ]),
            DataRow(cells: [
              DataCell(Text(press90.toString())),
              DataCell(Text('1')),
              DataCell(Text('3+')),
            ]),
            DataRow(cells: [
              DataCell(Text(press70.toString())),
              DataCell(Text('5')),
              DataCell(Text('5')),
            ]),
          ]),
        ]),
      ),
    );
  }
}
