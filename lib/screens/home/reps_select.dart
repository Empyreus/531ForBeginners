import 'package:flutter/material.dart';
import 'package:for_beginners_531/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_beginners_531/screens/weights/week1/squat_screen.dart';
import 'package:for_beginners_531/screens/weights/week1/bench_screen.dart';
import 'package:for_beginners_531/screens/weights/week1/deadlift_screen.dart';
import 'package:for_beginners_531/screens/weights/week1/press_screen.dart';
import 'package:for_beginners_531/screens/weights/week2/squat_screen.dart';
import 'package:for_beginners_531/screens/weights/week2/bench_screen.dart';
import 'package:for_beginners_531/screens/weights/week2/deadlift_screen.dart';
import 'package:for_beginners_531/screens/weights/week2/press_screen.dart';
import 'package:for_beginners_531/screens/weights/week3/squat_screen.dart';
import 'package:for_beginners_531/screens/weights/week3/bench_screen.dart';
import 'package:for_beginners_531/screens/weights/week3/deadlift_screen.dart';
import 'package:for_beginners_531/screens/weights/week3/press_screen.dart';

class RepsSelect extends StatefulWidget {
  @override
  _RepsSelectState createState() => _RepsSelectState();
}

class _RepsSelectState extends State<RepsSelect> {
  String uid;

  @override
  void initState() {
    super.initState();
    getUid();
  }

  getUid() async {
    await AuthService()
        .uid
        .then((result) => {uid = result, print("test $uid"), setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
          Center(
              child: Text(
            'Week 1',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          GridView.count(
            childAspectRatio: 2,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Day 1',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Day 2',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                      child: Text(
                    'Day 3',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )))
            ],
          ),
          GridView.count(
            childAspectRatio: 2,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week1SquatTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Squat"),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week1DeadliftTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Deadlift"),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week1BenchTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Bench"),
                      )))
            ],
          ),
          GridView.count(
            childAspectRatio: 2,
            shrinkWrap: true,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week1BenchTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Bench"),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week1PressTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Press"),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week1SquatTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Squat"),
                      )))
            ],
          ),
          Center(
              child: Text(
            'Week 1',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          GridView.count(
            childAspectRatio: 2,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Day 1',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Day 2',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                      child: Text(
                    'Day 3',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )))
            ],
          ),
          GridView.count(
            childAspectRatio: 2,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week2SquatTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Squat"),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week2DeadliftTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Deadlift"),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week2BenchTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Bench"),
                      )))
            ],
          ),
          GridView.count(
            childAspectRatio: 2,
            shrinkWrap: true,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week2BenchTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Bench"),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week2PressTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Press"),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: RaisedButton(
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Week2SquatTableScreen(uid: uid)),
                        );
                      },
                      child: Center(
                        child: Text("Squat"),
                      )))
            ],
          ),
          Center(
              child: Text(
            'Week 1',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          GridView.count(
            childAspectRatio: 2,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Day 1',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Day 2',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                      child: Text(
                    'Day 3',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )))
            ],
          ),
          GridView.count(
            childAspectRatio: 2,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Week3SquatTableScreen(uid: uid)),
                            );
                          },
                          child: Center(
                            child: Text("Squat"),
                          ))
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Week3DeadliftTableScreen(uid: uid)),
                            );
                          },
                          child: Center(
                            child: Text("Deadlift"),
                          ))
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Week3BenchTableScreen(uid: uid)),
                            );
                          },
                          child: Center(
                            child: Text("Bench"),
                          ))
              )
            ],
          ),
          GridView.count(
            childAspectRatio: 2,
            physics: ScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Week3BenchTableScreen(uid: uid)),
                            );
                          },
                          child: Center(
                            child: Text("Bench"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Week3PressTableScreen(uid: uid)),
                            );
                          },
                          child: Center(
                            child: Text("Press"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RaisedButton(
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Week3SquatTableScreen(uid: uid)),
                            );
                          },
                          child: Center(
                            child: Text("Squat"),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 1),
              )
            ],
          )
        ]),
      ),
    );
  }
}
