// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/pages/edit_page.dart';
import 'package:crud/services/firestore.dart';
import 'package:crud/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailedView extends StatefulWidget {
  final String docID;
  DetailedView({
    super.key,
    required this.docID,
  });

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  final FirestoreService firestoreService = FirestoreService();

  confirmDeleteUser() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            dialog: 'Are You Sure, You wanna Delete this user',
            onClickSave: () async {
              await firestoreService
                  .deleteUser(docID: widget.docID)
                  .then((onValue) {
                Navigator.pop(context);
              });

              Fluttertoast.showToast(
                msg: 'The User has Deleted Successfully',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                backgroundColor: Colors.black54,
                textColor: Colors.white,
              );

              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'User Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: confirmDeleteUser,
        label: const Text('Delete'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 100),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(
                    Icons.person_pin_rounded,
                    size: 150,
                    color: Colors.black54,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.docID)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error : ${snapshot.error}'),
                        );
                      }
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return const Center(
                          child: Text('No Data Found'),
                        );
                      }

                      final data =
                          snapshot.data!.data() as Map<String, dynamic>;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'doc ID : ${widget.docID}',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Text(
                            'Name: ${data['Name'] ?? 'N/A'}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Email: ${data['Email'] ?? 'N/A'}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Mobile: ${data['Mobile'] ?? 'N/A'}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Age: ${data['Age'] ?? 'N/A'}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Job Discription: ${data['Job Discription'] ?? 'N/A'}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Salary: ${data['Salary'] ?? 'N/A'}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 50, horizontal: 105),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPage(
                                      docID: widget.docID,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
