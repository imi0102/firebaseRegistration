import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compound/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      print("user Data:: ${userData.data()}");
      return UserModel.fromData(userData.data());
      return null;
    } catch (e) {
      return e.message;
    }
  }
}
