import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:for_beginners_531/models/weight.dart';
import 'package:for_beginners_531/screens/home/weight_tile.dart';

class WeightList extends StatefulWidget {
  @override
  _WeightListState createState() => _WeightListState();
}

class _WeightListState extends State<WeightList> {

  final names = ["Squat", "Bench Press", "Dead Lift", "Overhead Press"];

  @override
  Widget build(BuildContext context) {
    final weights = Provider.of<List<Weight>>(context);

    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index){
        return WeightTile(weights: weights, name: names[index]);
      }
    );
  }
}
