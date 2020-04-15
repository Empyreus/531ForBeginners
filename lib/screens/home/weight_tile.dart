import 'package:flutter/material.dart';
import 'package:for_beginners_531/models/weight.dart';

class WeightTile extends StatelessWidget {
  final weights;
//  final Weight weight;
  final String name;

  WeightTile({this.weights, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text(name),
              trailing: Text(0.toString()),
            )
        )
    );
  }
}
