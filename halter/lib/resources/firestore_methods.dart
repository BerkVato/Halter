import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halter/models/exercise.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //upload post
 Future<String> addExercise(String exerciseName, String sets, String weight, String uid,)
  async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String exerciseId = const Uuid().v1(); // creates unique id based on time
      Exercise exercise = Exercise(
        exerciseName: exerciseName,
        uid: uid,
        exerciseId: exerciseId,
        sets: sets,
        weight: weight,
      );
      _firestore.collection('workouts').doc(exerciseId).set(exercise.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }



//follow user
  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
          List following = (snap.data()! as dynamic)['following'];

          if(following.contains(followId)) {
            //remove follower if already
            await _firestore.collection('users').doc(followId).update({
              'followers' : FieldValue.arrayRemove([uid])
            });
            await _firestore.collection('users').doc(uid).update({
              'following' : FieldValue.arrayRemove([followId])
            });
          }else {
            await _firestore.collection('users').doc(followId).update({
              'followers' : FieldValue.arrayUnion([uid])
            });
            await _firestore.collection('users').doc(uid).update({
              'following' : FieldValue.arrayUnion([followId])
            });
          }

    } catch (e) {
      print(e.toString());
    }
  }
}
