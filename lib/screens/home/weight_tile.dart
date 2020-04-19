import 'package:flutter/material.dart';
import 'package:for_beginners_531/models/weight.dart';
import 'package:for_beginners_531/screens/home/popup_weight.dart';

class WeightTile extends StatelessWidget {
  final int weight;
  final String name;

  WeightTile({this.weight, this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(name),
                trailing: Text(this.weight.toString()),
              ))),
      onTap: () => _showDialog(context),
    );
  }
}

void _showDialog(BuildContext context) {
  final _formKey = GlobalKey<FormState>();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Enter New Weight'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Clear"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
