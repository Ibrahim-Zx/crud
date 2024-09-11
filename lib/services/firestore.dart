import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get the collection
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  //create : add a note
  Future<void> addUser(
    String name,
    String email,
    String mobile,
    String age,
    String jobDiscription,
    String salary,
  ) {
    return users.add({
      'Name': name,
      'Email': email,
      'Mobile': mobile,
      'Age': age,
      'Job Discription': jobDiscription,
      'Salary': salary,
    });
  }

  //read : display the note
  Stream<QuerySnapshot> getUserStream() {
    final userStream = FirebaseFirestore.instance
        .collection('users')
        .orderBy('Name', descending: false)
        .snapshots();

    return userStream;
  }

  //update : update the note
  Future updateUser({
    required String docID,
    required Map<String, dynamic> updatedInfo,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(docID)
        .update(updatedInfo);
  }

  //Delete
  Future deleteUser({
    required String docID,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(docID).delete();
  }
}
