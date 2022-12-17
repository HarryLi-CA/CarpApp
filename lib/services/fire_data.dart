import 'package:carpto/Models/userData/userInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  final String email;
  DatabaseService({
    required this.email,
    required this.uid}
  );

  // collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("students");

  Future updateUser(String name, String handle, String bio) async{
    return await usersCollection.doc(email).set({
      'name': name,
      'handle': handle,
      'bio': bio,
    });
  }
  
  List<UserData> _userInfoFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      dynamic nonNullData = doc.data()??{'',"","","",""};
      return UserData(
        nonNullData['userId'],
        doc.id,
        nonNullData['handle'],
        nonNullData['firstName'],
        nonNullData['lastName'],
        nonNullData['bio'],
      );
    }).toList();
  }

  Stream<List<UserData>> get users{
    return usersCollection.snapshots()
    .map(_userInfoFromSnapshot);
  }

}
