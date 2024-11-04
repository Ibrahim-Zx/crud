import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/main.dart';
import 'package:crud/pages/add_new_user.dart';
import 'package:crud/pages/detailed_view.dart';
import 'package:crud/services/firestore.dart';
import 'package:crud/util/dialog_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FirestoreService firestoreService = FirestoreService();
  int selectedSlider = 0;

  void setSelectedSlider(int value) {
    setState(() {
      selectedSlider = value;
    });
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  bool slider() {
    if (selectedSlider == 0) {
      return true;
    } else {
      return false;
    }
  }

  confirmDeleteCustomer(String docID) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            dialog: 'Are You Sure, You wanna Delete this user',
            onClickSave: () async {
              await firestoreService
                  .deleteCustomer(docID: docID)
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
            },
          );
        });
  }

  confirmDeleteCompany(String docID) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            dialog: 'Are You Sure, You wanna Delete this company',
            onClickSave: () async {
              await firestoreService
                  .deleteCompany(docID: docID)
                  .then((onValue) {
                Navigator.pop(context);
              });

              Fluttertoast.showToast(
                msg: 'The company has Deleted Successfully',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                backgroundColor: Colors.black54,
                textColor: Colors.white,
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'C R U D',
          style: GoogleFonts.merienda(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const AddNewUser(),
          //   ),
          // );
          context.go('/mainPage/addNewUserPage');
        },
        label: Text(
          'Add New User',
          style: GoogleFonts.merienda(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: CupertinoSlidingSegmentedControl(
                children: {
                  0: Text(
                    'User Info',
                    style: TextStyle(
                      color: slider() ? Colors.white : Colors.black,
                    ),
                  ),
                  1: Text(
                    'Company Info',
                    style: TextStyle(
                      color: slider() ? Colors.black : Colors.white,
                    ),
                  ),
                },
                backgroundColor: Colors.deepPurple.shade100,
                thumbColor: Colors.deepPurple,
                groupValue: selectedSlider,
                onValueChanged: (value) {
                  setSelectedSlider(value as int);
                },
              ),
            ),
            Visibility(
              visible: selectedSlider == 0,
              child: StreamBuilder(
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
                        Map<String, dynamic> customerData =
                            document.data() as Map<String, dynamic>;
                        String userName = customerData['Name'];
                        String userEmail = customerData['Email'];

                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailedView(
                                    docID: docID,
                                    selectedSlider: selectedSlider,
                                  ),
                                ),
                              );
                            },
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (del) {
                                      confirmDeleteCustomer(docID);
                                    },
                                    icon: Icons.delete,
                                    backgroundColor: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                      // Row(
                                      //   children: [
                                      // IconButton(
                                      //   onPressed: () {
                                      //     confirmDeleteCustomer(docID);
                                      //   },
                                      //   icon: const Icon(
                                      //     Icons.delete,
                                      //     color: Colors.deepPurple,
                                      //   ),
                                      // ),
                                      const Icon(
                                        Icons.chevron_right_sharp,
                                        color: Colors.deepPurple,
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                  // ],
                                  // ),
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
            ),
            Visibility(
              visible: selectedSlider == 1,
              child: StreamBuilder(
                stream: firestoreService.getCompanyStream(),
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
                    List<DocumentSnapshot> companyList = snapshot.data!.docs;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: companyList.length,
                      itemBuilder: (context, index) {
                        //get each individual doc
                        DocumentSnapshot document = companyList[index];
                        String docID = document.id;

                        //get data from doc
                        Map<String, dynamic> companyData =
                            document.data() as Map<String, dynamic>;
                        String companyName = companyData['Company Name'];
                        String companyEmail = companyData['Company Email'];

                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailedView(
                                    docID: docID,
                                    selectedSlider: selectedSlider,
                                  ),
                                ),
                              );
                            },
                            child: Slidable(
                              endActionPane: ActionPane(
                                  motion: const StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (del) {
                                        confirmDeleteCompany(docID);
                                      },
                                      icon: Icons.delete,
                                      backgroundColor: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ]),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            companyName,
                                            style: GoogleFonts.merienda(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            companyEmail,
                                            style: GoogleFonts.merienda(
                                              color: Colors.indigo[900],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Row(
                                      //   children: [
                                      // IconButton(
                                      //   onPressed: () {
                                      //     confirmDeleteCompany(docID);
                                      //   },
                                      //   icon: const Icon(
                                      //     Icons.delete,
                                      //     color: Colors.deepPurple,
                                      //   ),
                                      // ),
                                      const Icon(
                                        Icons.chevron_right_sharp,
                                        color: Colors.deepPurple,
                                        size: 40,
                                      ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
