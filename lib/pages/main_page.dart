import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/pages/add_new_user.dart';
import 'package:crud/pages/detailed_view.dart';
import 'package:crud/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FirestoreService firestoreService = FirestoreService();

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('User List'),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout_sharp),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewUser(),
            ),
          );
        },
        label: const Text('Add New User'),
      ),
      body: StreamBuilder(
        stream: firestoreService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            List<DocumentSnapshot> userList = snapshot.data!.docs;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: userList.length,
              itemBuilder: (context, index) {
                //get each individual doc
                DocumentSnapshot document = userList[index];
                String docID = document.id;

                //get data from doc
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String userName = data['Name'];
                String userEmail = data['Email'];

                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailedView(
                            docID: docID,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.amber[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  userEmail,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.chevron_right_sharp,
                              color: Colors.amber,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text('No Data Found');
          }
        },
      ),
    );
  }
}
