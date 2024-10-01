import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get the collection
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference company =
      FirebaseFirestore.instance.collection("company");
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

  Future<void> addCompany(
    String companyName,
    String companyEmail,
    String companyMobile,
    String companyAddress,
    String companyDiscription,
  ) {
    return company.add({
      'Company Name': companyName,
      'Company Email': companyEmail,
      'Company Mobile': companyMobile,
      'Company Address': companyAddress,
      'Company Discription': companyDiscription,
    });
  }

  //read : display the note
  Stream<QuerySnapshot> getUserStream() {
    final userStream = FirebaseFirestore.instance
        .collection('users')
        .orderBy('Name', descending: true)
        .snapshots();

    return userStream;
  }

  Stream<QuerySnapshot> getCompanyStream() {
    final companyStream = FirebaseFirestore.instance
        .collection('company')
        .orderBy('Company Name', descending: true)
        .snapshots();

    return companyStream;
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

  Future updateCompany({
    required String docID,
    required Map<String, dynamic> updatedInfo,
  }) async {
    await FirebaseFirestore.instance
        .collection('company')
        .doc(docID)
        .update(updatedInfo);
  }

  //Delete
  Future deleteCustomer({
    required String docID,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(docID).delete();
  }

  Future deleteCompany({
    required String docID,
  }) async {
    await FirebaseFirestore.instance.collection('company').doc(docID).delete();
  }
}
