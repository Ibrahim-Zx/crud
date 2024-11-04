// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/pages/edit_page.dart';
import 'package:crud/services/firestore.dart';
import 'package:crud/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedView extends StatefulWidget {
  final String docID;
  final int selectedSlider;
  const DetailedView({
    super.key,
    required this.docID,
    required this.selectedSlider,
  });

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  final FirestoreService firestoreService = FirestoreService();

  // confirmDeleteCustomer() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return DialogBox(
  //           dialog: 'Are You Sure, You wanna Delete this user',
  //           onClickSave: () async {
  //             await firestoreService
  //                 .deleteCustomer(docID: widget.docID)
  //                 .then((onValue) {
  //               Navigator.pop(context);
  //             });

  //             Fluttertoast.showToast(
  //               msg: 'The User has Deleted Successfully',
  //               toastLength: Toast.LENGTH_LONG,
  //               gravity: ToastGravity.SNACKBAR,
  //               backgroundColor: Colors.black54,
  //               textColor: Colors.white,
  //             );

  //             Navigator.of(context).pop();
  //           },
  //         );
  //       });
  // }

  confirmDeleteCompany() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            dialog: 'Are You Sure, You wanna Delete this user',
            onClickSave: () async {
              await firestoreService
                  .deleteCompany(docID: widget.docID)
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
        backgroundColor: Colors.deepPurple,
        title: Text(
          'User Details',
          style: GoogleFonts.merienda(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => DetailedView(
        //               docID: widget.docID,
        //               selectedSlider: widget.selectedSlider,
        //             ),
        //           ),
        //         );
        //       },
        //       icon: const Icon(
        //         Icons.replay_outlined,
        //         color: Colors.white,
        //       )),
        // ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPage(
                docID: widget.docID,
                selectedSlider: widget.selectedSlider,
              ),
            ),
          );
        },
        label: Text(
          'Edit',
          style: GoogleFonts.merienda(),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 100),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
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
                  Visibility(
                    visible: widget.selectedSlider == 0,
                    child: FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.docID)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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

                        final customerData =
                            snapshot.data!.data() as Map<String, dynamic>;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'doc ID : ${widget.docID}',
                              style: GoogleFonts.jacquesFrancois(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              'Name: ${customerData['Name'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Email: ${customerData['Email'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Mobile: ${customerData['Mobile'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Age: ${customerData['Age'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Job Discription: ${customerData['Job Discription'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Salary: ${customerData['Salary'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            // const SizedBox(height: 50),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 105),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => EditPage(
                            //             docID: widget.docID,
                            //             selectedSlider: widget.selectedSlider,
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //     child: Container(
                            //       height: 50,
                            //       width: 100,
                            //       decoration: BoxDecoration(
                            //         color: Colors.deepPurple,
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       child: Center(
                            //         child: Text(
                            //           'Edit',
                            //           style: GoogleFonts.merienda(
                            //             color: Colors.white,
                            //             fontSize: 17,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: widget.selectedSlider == 1,
                    child: FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('company')
                          .doc(widget.docID)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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

                        final companyData =
                            snapshot.data!.data() as Map<String, dynamic>;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'doc ID : ${widget.docID}',
                              style: GoogleFonts.jacquesFrancois(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              'Name: ${companyData['Company Name'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Email: ${companyData['Company Email'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Mobile: ${companyData['Company Mobile'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Age: ${companyData['Company Address'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            Text(
                              'Job Discription: ${companyData['Company Discription'] ?? 'N/A'}',
                              style: GoogleFonts.jacquesFrancois(fontSize: 18),
                            ),
                            // const SizedBox(height: 50),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 105),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => EditPage(
                            //             docID: widget.docID,
                            //             selectedSlider: widget.selectedSlider,
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //     child: Container(
                            //       height: 50,
                            //       width: 100,
                            //       decoration: BoxDecoration(
                            //         color: Colors.deepPurple,
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       child: Center(
                            //         child: Text(
                            //           'Edit',
                            //           style: GoogleFonts.merienda(
                            //             color: Colors.white,
                            //             fontSize: 17,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        );
                      },
                    ),
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
