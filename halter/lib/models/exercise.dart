import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  final String exerciseName;
  final String sets;
  final String weight;

  const Exercise(
      {required this.exerciseName,
      required this.sets,
      required this.weight,});

  Map<String, dynamic> toJson() => {
        "exerciseName": exerciseName,
        "sets": sets,
        "weight": weight,
        
      };

  static Exercise fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Exercise(
      exerciseName: snapshot["exerciseName"],
      sets: snapshot["sets"],
      weight: snapshot["weight"],

    );
  }
}
