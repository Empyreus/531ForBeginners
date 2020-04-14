import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference weightCollection =
      Firestore.instance.collection('brews');

  Future<void> updateUserData(
      int squat, int bench, int deadlift, int press) async {
    return await weightCollection.document(uid).setData({
      'squat': squat,
      'bench': bench,
      'deadlift': deadlift,
      'press': press,
    });
  }
}
