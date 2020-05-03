import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BenchTable extends StatefulWidget {
  BenchTable({this.uid});

  final String uid;

  @override
  _BenchTableState createState() => _BenchTableState();
}

class _BenchTableState extends State<BenchTable> {
  int bench = -1;

  // Init Bench
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
    getWeights();
  }

  getWeights() async {
    Firestore.instance
        .collection('weights')
        .document(widget.uid)
        .get()
        .then((DocumentSnapshot docs) => {
              bench = docs['bench'],
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
            'Bench',
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
              DataCell(Text(bench40.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(bench50.toString())),
              DataCell(Text('1')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(Text(bench60.toString())),
              DataCell(Text('1')),
              DataCell(Text('3')),
            ]),
            DataRow(cells: [
              DataCell(Text(bench70.toString())),
              DataCell(Text('1')),
              DataCell(Text('3')),
            ]),
            DataRow(cells: [
              DataCell(Text(bench80.toString())),
              DataCell(Text('1')),
              DataCell(Text('3')),
            ]),
            DataRow(cells: [
              DataCell(Text(bench90.toString())),
              DataCell(Text('1')),
              DataCell(Text('3+')),
            ]),
            DataRow(cells: [
              DataCell(Text(bench70.toString())),
              DataCell(Text('5')),
              DataCell(Text('5')),
            ]),
          ]),
        ]),
      ),
    );
  }
}
