import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/pages/add_new_user.dart';
import 'package:crud/pages/detailed_view.dart';
import 'package:crud/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.deepPurple,
        title: Text(
          'User List',
          style: GoogleFonts.merienda(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(
              Icons.logout_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewUser(),
            ),
          );
        },
        label: Text(
          'Add New User',
          style: GoogleFonts.merienda(),
        ),
      ),
      body: StreamBuilder(
        stream: firestoreService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
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
                        color: Colors.deepPurple[200],
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
                                  style: GoogleFonts.merienda(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  userEmail,
                                  style: GoogleFonts.merienda(
                                    color: Colors.indigo[900],
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.chevron_right_sharp,
                              color: Colors.deepPurple,
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
