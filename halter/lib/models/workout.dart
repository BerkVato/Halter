import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halter/models/exercise.dart';

class Workout {
  final List<Exercise> exercises;
 

  const Workout(
      {required this.exercises,
      });

  Map<String, dynamic> toJson() => {
        "exercises": exercises,
        
        
      };

  static Workout fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Workout(
      exercises: snapshot["exercises"],
      

    );
  }
}