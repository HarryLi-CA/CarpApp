/*import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future updateUser(String handle, String email, String name, String bio) async{
    return db.collection("Users").doc(handle).update({
      "email": email,
      "name":name,
      "bio" : bio,
    });
  }
}*/