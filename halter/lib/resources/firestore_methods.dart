import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halter/models/workout.dart';
import 'package:halter/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//kullanıcı takip etme(followers ve following kısımlarına kullanıcıları ekliyoruz)
  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        //remove follower if already
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });
        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });
        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //yorum yapma
   Future<String> postComment(String postId, String text, String uid,
      String name, String profilePic) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {

        String commentId = const Uuid().v1();
        _firestore
            .collection('workouts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
// workoutu postlama yeni bir workout oluşturuyoruz ve database'e ekliyoruz
      Future<String> uploadPost(String workoutDescription, Uint8List file, String uid,
      String username, String profImage) async {
    
    String res = "Some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('workouts', file, true);
      String postId = const Uuid().v1(); // creates unique id based on time
      Workout post = Workout(
        workoutDescription: workoutDescription,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
      );
      _firestore.collection('workouts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  //like atma ve geri çekme (like yapılmışsa kontrol edip geri çekiyor)
  Future<String> likePost(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        
        _firestore.collection('workouts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {

        _firestore.collection('workouts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
// workout silme
  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('workouts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
//profile picture ve bio değiştirme
  Future<String> updateProfile(String uid, String usernameController, String bioController, Uint8List file ) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
    String photoUrl =
          await StorageMethods().uploadImageToStorage('users', file, false);
    String res = 'Some error occured';
    try {
      if (usernameController.isNotEmpty && bioController.isNotEmpty ) {
        docUser.update({
          'username' : usernameController,
          'bio' : bioController,
          'photoUrl' : photoUrl
        });
        return 'success';
      }
    } catch(err){
      res = err.toString();
    }
    return res;
  }



}
