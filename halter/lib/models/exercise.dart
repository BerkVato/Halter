import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  final String exerciseName;
  final String sets;
  final String weight;
  final String uid;
  final String exerciseId;

  const Exercise(
      {required this.exerciseName,
      required this.sets,
      required this.weight,
      required this.uid,
      required this.exerciseId});

  Map<String, dynamic> toJson() => {
        "exerciseName": exerciseName,
        "sets": sets,
        "weight": weight,
        "uid": uid,
        "exerciseId": exerciseId, 
      };

  static Exercise fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Exercise(
      exerciseName: snapshot["exerciseName"],
      sets: snapshot["sets"],
      weight: snapshot["weight"],
      uid: snapshot["uid"],
      exerciseId: snapshot["exerciseId"],
    );
  }
}
