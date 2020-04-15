import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_beginners_531/models/weight.dart';

class DatabaseService {

  // collection reference
  final CollectionReference weightCollection =
  Firestore.instance.collection('weights');

  Future<void> updateUserData(int squat, int bench, int deadlift,
      int press) async {
    return await weightCollection.document().setData({
      'squat': squat,
      'bench': bench,
      'deadlift': deadlift,
      'press': press,
    });
  }

  //weight list from snapshot
  List<Weight> _weightListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Weight(
        squat: doc.data['squat'] ?? 0,
        bench: doc.data['bench'] ?? 0,
        deadlift: doc.data['deadlift'] ?? 0,
        press: doc.data['press'] ?? 0,
      );
    }).toList();
  }

  //get weights stream
  Stream<List<Weight>> get weights {
    return weightCollection.snapshots().map(_weightListFromSnapshot);
  }
}
