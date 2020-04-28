import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_beginners_531/services/auth.dart';
import 'package:for_beginners_531/services/database.dart';
import 'package:for_beginners_531/models/weight.dart';
import 'package:for_beginners_531/screens/home/popup_weight.dart';

class WeightTile extends StatefulWidget {
  @override
  _WeightTileState createState() => _WeightTileState();
  final Weight weights;
  final String name;

  WeightTile({this.weights, this.name});
}

class _WeightTileState extends State<WeightTile> {

  Weight currentWeights;
  String uid;
  String value;



  @override
  void initState() {
    super.initState();
    currentWeights = widget.weights;
  }

  getUid() async {
    await AuthService().uid.then((result) => {
      uid = result,
      print("UID: $uid"),
      setWeights(),
    });
  }

  setWeights() async {
    switch (widget.name) {
      case "Squat":
        print("Value: " + value);
        DatabaseService(uid: uid).updateUserSquat(int.parse(value));
        currentWeights.squat = int.parse(value.toString());
        setState(() {});
    }
  }

  _showDialog(BuildContext context, String name) {
    String uid;
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
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'What do people call you?',
                            labelText: 'Name *',
                          ),
                          onSaved: (String  newWeight) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                            print("VALUE: $newWeight");
                            value = newWeight;
                            getUid();
                          },
                          validator: (String value) {
                            return value.contains('@') ? 'Do not use the @ char.' : null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    int weight;
    switch (widget.name) {
      case "Squat":
        weight = widget.weights.squat;
        break;
      case "Bench Press":
        weight = widget.weights.bench;
        break;
      case "Dead Lift":
        weight = widget.weights.deadlift;
        break;
      case "Overhead Press":
        weight = widget.weights.press;
        break;
    }

    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(widget.name),
                trailing: Text(weight.toString()),
              ))),
      onTap: () => _showDialog(context, widget.name)
    ,
    );
  }
}