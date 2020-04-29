import 'package:flutter/material.dart';
import 'package:for_beginners_531/services/auth.dart';
import 'package:for_beginners_531/services/database.dart';
import 'package:flutter/services.dart';

class WeightTile extends StatefulWidget {
  @override
  _WeightTileState createState() => _WeightTileState();
  final int weights;
  final String name;

  WeightTile({this.weights, this.name});
}

class _WeightTileState extends State<WeightTile> {

  int dispWeight;
  String uid;
  String value;

  @override
  void initState() {
    super.initState();
    dispWeight = widget.weights;
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
        DatabaseService(uid: uid).updateUserSquat(int.parse(value));
        dispWeight = int.parse(value.toString());
        setState(() {});
        break;
      case "Bench Press":
        DatabaseService(uid: uid).updateUserBench(int.parse(value));
        dispWeight = int.parse(value.toString());
        setState(() {});
        break;
      case "Dead Lift":
        DatabaseService(uid: uid).updateUserDeadlift(int.parse(value));
        dispWeight = int.parse(value.toString());
        setState(() {});
        break;
      case "Overhead Press":
        DatabaseService(uid: uid).updateUserPress(int.parse(value));
        dispWeight = int.parse(value.toString());
        setState(() {});
        break;
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
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            icon: Icon(Icons.fitness_center),
                            hintText: 'Enter New Weight',
                            labelText: 'New Weight *',
                          ),
                          onSaved: (String  newWeight) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                            value = newWeight;
                            getUid();
                          },
                          validator: (String value) {
                            if(int.parse(value) > 1000){
                              return 'Weight Must Be Below 1000';
                            }
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
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(widget.name),
                trailing: Text(dispWeight.toString()),
              ))),
      onTap: () => _showDialog(context, widget.name)
    ,
    );
  }
}