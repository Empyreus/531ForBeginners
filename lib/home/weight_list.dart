import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:for_beginners_531/models/weight.dart';
class WeightList extends StatefulWidget {
  @override
  _WeightListState createState() => _WeightListState();
}

class _WeightListState extends State<WeightList> {
  @override
  Widget build(BuildContext context) {
    final weights = Provider.of<List<Weight>>(context);

    weights.forEach((weight) {
      print(weight.squat);
      print(weight.bench);
      print(weight.deadlift);
      print(weight.press);
    });

    return Container();
  }
}
