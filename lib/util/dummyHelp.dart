// // import 'package:crud/services/firestore.dart';
// // import 'package:flutter/material.dart';

// // class DetailedView extends StatefulWidget {
// //   const DetailedView({super.key});

// //   @override
// //   State<DetailedView> createState() => _DetailedViewState();
// // }

// // class _DetailedViewState extends State<DetailedView> {
// //   final FirestoreService firestoreService = FirestoreService();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.deepPurple,
// //         title: const Text(
// //           'User Details',
// //           style: TextStyle(fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //       ),
// //       floatingActionButton: FloatingActionButton.extended(
// //         onPressed: () {},
// //         label: const Text('Edit'),
// //         backgroundColor: Colors.deepPurple,
// //         foregroundColor: Colors.black,
// //       ),
// //       body: Center(
// //         child: Padding(
// //           padding:
// //               const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 100),
// //           child: Container(
// //             height: double.infinity,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               color: Colors.deepPurple[100],
// //               borderRadius: BorderRadius.circular(10),
// //             ),
// //             child: const Column(
// //               children: [
// //                 Icon(
// //                   Icons.person_pin_rounded,
// //                   size: 150,
// //                   color: Colors.black54,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance
//             .collection('users')
//             .doc(documentId)
//             .get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error : ${snapshot.error}'),
//             );
//           }
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return const Center(
//               child: Text('No data found'),
//             );
//           }

//           var data = snapshot.data!.data() as Map<String, dynamic>;
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Document ID: $documentId',
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   'Name: ${data['Name'] ?? 'N/A'}',
//                 ),
//                 Text(
//                   'Email: ${data['Email'] ?? 'N/A'}',
//                 ),
//                 // Add more fields as needed
//               ],
//             ),
//           );
//         },
//       ),





// FULL CODE [ NO ERROR ] ;
//_________________________________________________________________


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DetailedView extends StatelessWidget {
//   final String documentId;

//   DetailedView({required this.documentId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text(
//           'User Details',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         label: const Text('Edit'),
//         backgroundColor: Colors.deepPurple,
//         foregroundColor: Colors.black,
//       ),
//       body: Center(
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 100),
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.deepPurple[100],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               children: [
//                 const Icon(
//                   Icons.person_pin_rounded,
//                   size: 150,
//                   color: Colors.black54,
//                 ),
//                 FutureBuilder<DocumentSnapshot>(
//                   future: FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(documentId)
//                       .get(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text('Error : ${snapshot.error}'),
//                       );
//                     }
//                     if (!snapshot.hasData || !snapshot.data!.exists) {
//                       return const Center(
//                         child: Text('No data found'),
//                       );
//                     }

//                     var data = snapshot.data!.data() as Map<String, dynamic>;
//                     return Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             'Document ID: $documentId',
//                             style: const TextStyle(
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 50),
//                           Text(
//                             'Name: ${data['Name'] ?? 'N/A'}',
//                             style: const TextStyle(fontSize: 21),
//                           ),
//                           Text(
//                             'Email: ${data['Email'] ?? 'N/A'}',
//                             style: const TextStyle(fontSize: 21),
//                           ),
//                           Text(
//                             'Mobile: ${data['Mobile'] ?? 'N/A'}',
//                             style: const TextStyle(fontSize: 21),
//                           ),
//                           Text(
//                             'Age: ${data['Age'] ?? 'N/A'}',
//                             style: const TextStyle(fontSize: 21),
//                           ),
//                           Text(
//                             'Job Discription: ${data['Job Discription'] ?? 'N/A'}',
//                             style: const TextStyle(fontSize: 21),
//                           ),
//                           Text(
//                             'Salary: ${data['Salary'] ?? 'N/A'}',
//                             style: const TextStyle(fontSize: 21),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }









// Own Written Code;
// _____________________________________________________________________



// // ignore_for_file: must_be_immutable

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crud/services/firestore.dart';
// import 'package:flutter/material.dart';

// class DetailedView extends StatefulWidget {
//   final String docID;
//   const DetailedView({
//     super.key,
//     required this.docID,
//   });

//   @override
//   State<DetailedView> createState() => _DetailedViewState();
// }

// class _DetailedViewState extends State<DetailedView> {
//   final FirestoreService firestoreService = FirestoreService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text(
//           'User Details',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         label: const Text('Edit'),
//         backgroundColor: Colors.deepPurple,
//         foregroundColor: Colors.black,
//       ),
//       body: Center(
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 100),
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.deepPurple[100],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               children: [
//                 const Icon(
//                   Icons.person_pin_rounded,
//                   size: 150,
//                   color: Colors.black54,
//                 ),
//                 FutureBuilder<DocumentSnapshot>(
//                   future: FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(docID)
//                       .get(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text('Error : ${snapshot.error}'),
//                       );
//                     }
//                     if (!snapshot.hasData || !snapshot.data!.exists) {
//                       return const Center(
//                         child: Text('No Data Found'),
//                       );
//                     }

//                     final Data = snapshot.data!.data() as Map<String, dynamic>;

//                     return Column(
//                       children: [
//                         Text(
//                           'doc ID : ${Data['Name']}',
//                           style: const TextStyle(
//                             color: Colors.red,
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



//ADD NEW USER PAGE :

// ignore_for_file: unrelated_type_equality_checks

// import 'package:crud/services/firestore.dart';
// import 'package:crud/util/dialog_box.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AddNewUser extends StatefulWidget {
//   const AddNewUser({super.key});

//   @override
//   State<AddNewUser> createState() => _AddNewUserState();
// }

// class _AddNewUserState extends State<AddNewUser> {
//   final FirestoreService firestoreService = FirestoreService();
//   final _formKey = GlobalKey<FormState>();
//   String _selectedForm = 'customerDetails';

//   final _nameController = TextEditingController();
//   final _eMailController = TextEditingController();
//   final _mobileController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _jobDiscriptionController = TextEditingController();
//   final _salaryController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _eMailController.dispose();
//     _ageController.dispose();
//     _mobileController.dispose();
//     _jobDiscriptionController.dispose();
//     _salaryController.dispose();
//     _companyNameController.dispose();
//     _companyEmailController.dispose();
//     _companyNumberController.dispose();
//     _companyAddressController.dispose();
//     _companyDiscriptionController.dispose();

//     super.dispose();
//   }

//   confirmAddUser() {
//     if (_formKey.currentState?.validate() ?? false) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return DialogBox(
//               dialog: 'Are You Sure, You wanna Create a new user',
//               onClickSave: () {
//                 firestoreService.addUser(
//                   _nameController.text,
//                   _eMailController.text,
//                   _mobileController.text,
//                   _ageController.text,
//                   _jobDiscriptionController.text,
//                   _salaryController.text,
//                 );
//                 Fluttertoast.showToast(
//                   msg: 'The User has Added Successfully',
//                   toastLength: Toast.LENGTH_LONG,
//                   gravity: ToastGravity.SNACKBAR,
//                   backgroundColor: Colors.black54,
//                   textColor: Colors.white,
//                 );

//                 Navigator.pop(context);
//                 Navigator.pop(context);
//               },
//             );
//           });
//     }
//   }

//   final _companyNameController = TextEditingController();
//   final _companyEmailController = TextEditingController();
//   final _companyNumberController = TextEditingController();
//   final _companyAddressController = TextEditingController();
//   final _companyDiscriptionController = TextEditingController();

//   confirmAddCompany() {
//     if (_formKey.currentState?.validate() ?? false) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return DialogBox(
//               dialog: 'Are You Sure, You wanna Create a new Company',
//               onClickSave: () {
//                 firestoreService.addCompany(
//                   _companyNameController.text,
//                   _companyEmailController.text,
//                   _companyNameController.text,
//                   _companyAddressController.text,
//                   _companyDiscriptionController.text,
//                 );
//                 Fluttertoast.showToast(
//                   msg: 'The Company has Added Successfully',
//                   toastLength: Toast.LENGTH_LONG,
//                   gravity: ToastGravity.SNACKBAR,
//                   backgroundColor: Colors.black54,
//                   textColor: Colors.white,
//                 );

//                 Navigator.pop(context);
//                 Navigator.pop(context);
//               },
//             );
//           });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: Text(
//           'Add New User',
//           style: GoogleFonts.merienda(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 radioButton(),
//                 const SizedBox(height: 20),
//                 _selectedForm == 'customerDetails'
//                     ? const CustomerDetails()
//                     : const CompanyDetails(),
//                 submitButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   onTapSubmit() {
//     if (_selectedForm == 'customerDetails') {
//       return confirmAddUser();
//     } else {
//       return confirmAddCompany();
//     }
//   }

//   submitButton() {
//     return GestureDetector(
//       onTap: onTapSubmit,
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.deepPurple,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Center(
//           child: Text(
//             'S U B M I T',
//             style: GoogleFonts.merienda(
//               color: Colors.white,
//               fontSize: 17,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   radioButton() {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: ListTile(
//             title: const Text('customer details'),
//             leading: Radio(
//                 value: 'customerDetails',
//                 groupValue: _selectedForm,
//                 onChanged: (value) {
//                   setState(
//                     () {
//                       _selectedForm = value!;
//                     },
//                   );
//                 }),
//           ),
//         ),
//         Expanded(
//           child: ListTile(
//             title: const Text('company details'),
//             leading: Radio<String>(
//               value: 'companyDetails',
//               groupValue: _selectedForm,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     _selectedForm = value!;
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// //Customer Details Form :
// class CustomerDetails extends StatefulWidget {
//   const CustomerDetails({super.key});

//   @override
//   State<CustomerDetails> createState() => _CustomerDetailsState();
// }

// class _CustomerDetailsState extends State<CustomerDetails> {
//   final FirestoreService firestoreService = FirestoreService();

//   final _nameController = TextEditingController();
//   final _eMailController = TextEditingController();
//   final _mobileController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _jobDiscriptionController = TextEditingController();
//   final _salaryController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _eMailController.dispose();
//     _ageController.dispose();
//     _mobileController.dispose();
//     _jobDiscriptionController.dispose();
//     _salaryController.dispose();

//     super.dispose();
//   }

//   // confirmAddUser() {
//   //   if (_formKey.currentState?.validate() ?? false) {
//   //     showDialog(
//   //         context: context,
//   //         builder: (context) {
//   //           return DialogBox(
//   //             dialog: 'Are You Sure, You wanna Create a new user',
//   //             onClickSave: () {
//   //               firestoreService.addUser(
//   //                 _nameController.text,
//   //                 _eMailController.text,
//   //                 _mobileController.text,
//   //                 _ageController.text,
//   //                 _jobDiscriptionController.text,
//   //                 _salaryController.text,
//   //               );
//   //               Fluttertoast.showToast(
//   //                 msg: 'The User has Added Successfully',
//   //                 toastLength: Toast.LENGTH_LONG,
//   //                 gravity: ToastGravity.SNACKBAR,
//   //                 backgroundColor: Colors.black54,
//   //                 textColor: Colors.white,
//   //               );

//   //               Navigator.pop(context);
//   //               Navigator.pop(context);
//   //             },
//   //           );
//   //         });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // nameTitle(),
//         nameTextField(),
//         // eMailTitle(),
//         eMailTextField(),
//         // numberTitle(),
//         numberTextField(),
//         // ageTitle(),
//         ageTextField(),
//         // jobDiscriptionTitle(),
//         jobDiscriptionTextField(),
//         // salaryTitle(),
//         salaryTextField(),
//       ],
//     );
//   }

//   // nameTitle() {
//   nameTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _nameController,
//         decoration: InputDecoration(
//           labelText: 'Name',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // eMailTitle() {
//   eMailTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _eMailController,
//         decoration: InputDecoration(
//           labelText: 'E-Mail',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (val) {
//           EmailValidator.validate(val!) ? null : 'Please enter valid e-mail';
//           return null;
//         },
//       ),
//     );
//   }

//   // numberTitle() {
//   numberTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: _mobileController,
//         decoration: InputDecoration(
//           labelText: 'Number',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           } else if (int.tryParse(value) == null) {
//             return 'The entered value should be a number';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // ageTitle() {
//   ageTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: _ageController,
//         decoration: InputDecoration(
//           labelText: 'Age',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           } else if (int.tryParse(value) == null) {
//             return 'The entered value should be a number';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // jobDiscriptionTitle() {
//   jobDiscriptionTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _jobDiscriptionController,
//         decoration: InputDecoration(
//           labelText: 'Job Discription',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // salaryTitle() {
//   salaryTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: _salaryController,
//         decoration: InputDecoration(
//           labelText: 'Salary',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           } else if (int.tryParse(value) == null) {
//             return 'The entered value should be a number';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // createNewUser() {
//   //   return GestureDetector(
//   //     onTap: confirmAddUser,
//   //     child: Container(
//   //       height: 50,
//   //       decoration: BoxDecoration(
//   //         color: Colors.deepPurple,
//   //         borderRadius: BorderRadius.circular(10),
//   //       ),
//   //       child: Center(
//   //         child: Text(
//   //           'S U B M I T',
//   //           style: GoogleFonts.merienda(
//   //             color: Colors.white,
//   //             fontSize: 17,
//   //             fontWeight: FontWeight.bold,
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }

// class CompanyDetails extends StatefulWidget {
//   const CompanyDetails({super.key});

//   @override
//   State<CompanyDetails> createState() => _CompanyDetailsState();
// }

// class _CompanyDetailsState extends State<CompanyDetails> {
//   final FirestoreService firestoreService = FirestoreService();

//   final _companyNameController = TextEditingController();
//   final _companyEmailController = TextEditingController();
//   final _companyNumberController = TextEditingController();
//   final _companyAddressController = TextEditingController();
//   final _companyDiscriptionController = TextEditingController();

//   @override
//   void dispose() {
//     _companyNameController.dispose();
//     _companyEmailController.dispose();
//     _companyNumberController.dispose();
//     _companyAddressController.dispose();
//     _companyDiscriptionController.dispose();

//     super.dispose();
//   }

//   // confirmAddCompany() {
//   //   if (_formKey.currentState?.validate() ?? false) {
//   //     showDialog(
//   //         context: context,
//   //         builder: (context) {
//   //           return DialogBox(
//   //             dialog: 'Are You Sure, You wanna Create a new Company',
//   //             onClickSave: () {
//   //               firestoreService.addCompany(
//   //                 _companyNameController.text,
//   //                 _companyEmailController.text,
//   //                 _companyNameController.text,
//   //                 _companyAddressController.text,
//   //                 _companyDiscriptionController.text,
//   //               );
//   //               Fluttertoast.showToast(
//   //                 msg: 'The Company has Added Successfully',
//   //                 toastLength: Toast.LENGTH_LONG,
//   //                 gravity: ToastGravity.SNACKBAR,
//   //                 backgroundColor: Colors.black54,
//   //                 textColor: Colors.white,
//   //               );

//   //               Navigator.pop(context);
//   //               Navigator.pop(context);
//   //             },
//   //           );
//   //         });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // nameTitle(),
//         companyNameTextField(),
//         // eMailTitle(),
//         companyEmailTextField(),
//         // numberTitle(),
//         companyNumberTextField(),
//         // ageTitle(),
//         companyAddressTextField(),
//         // jobDiscriptionTitle(),
//         companyDiscriptionTextField(),
//       ],
//     );
//   }

//   companyNameTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _companyNameController,
//         decoration: InputDecoration(
//           labelText: 'Company Name',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   companyEmailTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _companyEmailController,
//         decoration: InputDecoration(
//           labelText: 'Company Email',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (val) {
//           EmailValidator.validate(val!) ? null : 'Please enter valid e-mail';
//           return null;
//         },
//       ),
//     );
//   }

//   companyNumberTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: _companyNumberController,
//         decoration: InputDecoration(
//           labelText: 'Company Number',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           } else if (int.tryParse(value) == null) {
//             return 'The entered value should be a number';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   companyAddressTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _companyAddressController,
//         decoration: InputDecoration(
//           labelText: 'Company Address',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   companyDiscriptionTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _companyDiscriptionController,
//         decoration: InputDecoration(
//           labelText: 'Company Discription',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // createNewCompany() {
//   //   return GestureDetector(
//   //     onTap: confirmAddCompany,
//   //     child: Container(
//   //       height: 50,
//   //       decoration: BoxDecoration(
//   //         color: Colors.deepPurple,
//   //         borderRadius: BorderRadius.circular(10),
//   //       ),
//   //       child: Center(
//   //         child: Text(
//   //           'S U B M I T',
//   //           style: GoogleFonts.merienda(
//   //             color: Colors.white,
//   //             fontSize: 17,
//   //             fontWeight: FontWeight.bold,
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }




//sdfghjklsdfghjkasdfghjk

// // ignore_for_file: unrelated_type_equality_checks

// import 'package:crud/services/firestore.dart';
// import 'package:crud/util/dialog_box.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AddNewUser extends StatefulWidget {
//   const AddNewUser({super.key});

//   @override
//   State<AddNewUser> createState() => _AddNewUserState();
// }

// class _AddNewUserState extends State<AddNewUser> {
//   final FirestoreService firestoreService = FirestoreService();
//   final _formKey = GlobalKey<FormState>();
//   String _selectedForm = 'customerDetails';

//   final _nameController = TextEditingController();
//   final _eMailController = TextEditingController();
//   final _mobileController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _jobDiscriptionController = TextEditingController();
//   final _salaryController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _eMailController.dispose();
//     _ageController.dispose();
//     _mobileController.dispose();
//     _jobDiscriptionController.dispose();
//     _salaryController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: Text(
//           'Add New User',
//           style: GoogleFonts.merienda(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 radioButton(),
//                 const SizedBox(height: 20),
//                 _selectedForm == 'customerDetails'
//                     ? CustomerDetails(formKey: _formKey)
//                     : CompanyDetails(formKey: _formKey),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   radioButton() {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: ListTile(
//             title: const Text('customer details'),
//             leading: Radio(
//                 value: 'customerDetails',
//                 groupValue: _selectedForm,
//                 onChanged: (value) {
//                   setState(
//                     () {
//                       _selectedForm = value!;
//                     },
//                   );
//                 }),
//           ),
//         ),
//         Expanded(
//           child: ListTile(
//             title: const Text('company details'),
//             leading: Radio<String>(
//               value: 'companyDetails',
//               groupValue: _selectedForm,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     _selectedForm = value!;
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// //Customer Details Form :
// class CustomerDetails extends StatefulWidget {
//   final GlobalKey<FormState> formKey;
//   const CustomerDetails({super.key, required this.formKey});

//   @override
//   State<CustomerDetails> createState() => _CustomerDetailsState();
// }

// class _CustomerDetailsState extends State<CustomerDetails> {
//   final FirestoreService firestoreService = FirestoreService();
//   final _formKey = GlobalKey<FormState>();

//   final _nameController = TextEditingController();
//   final _eMailController = TextEditingController();
//   final _mobileController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _jobDiscriptionController = TextEditingController();
//   final _salaryController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _eMailController.dispose();
//     _ageController.dispose();
//     _mobileController.dispose();
//     _jobDiscriptionController.dispose();
//     _salaryController.dispose();

//     super.dispose();
//   }

//   confirmAddUser() {
//     print("Submitting user data");
//     if (_formKey.currentState?.validate() ?? false) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return DialogBox(
//               dialog: 'Are You Sure, You wanna Create a new user',
//               onClickSave: () {
//                 firestoreService.addUser(
//                   _nameController.text,
//                   _eMailController.text,
//                   _mobileController.text,
//                   _ageController.text,
//                   _jobDiscriptionController.text,
//                   _salaryController.text,
//                 );
//                 Fluttertoast.showToast(
//                   msg: 'The User has Added Successfully',
//                   toastLength: Toast.LENGTH_LONG,
//                   gravity: ToastGravity.SNACKBAR,
//                   backgroundColor: Colors.black54,
//                   textColor: Colors.white,
//                 );

//                 Navigator.pop(context);
//                 Navigator.pop(context);
//               },
//             );
//           });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // nameTitle(),
//         nameTextField(),
//         // eMailTitle(),
//         eMailTextField(),
//         // numberTitle(),
//         numberTextField(),
//         // ageTitle(),
//         ageTextField(),
//         // jobDiscriptionTitle(),
//         jobDiscriptionTextField(),
//         // salaryTitle(),
//         salaryTextField(),
//         const SizedBox(height: 15),
//         createNewUser(),
//       ],
//     );
//   }

//   // nameTitle() {
//   nameTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _nameController,
//         decoration: InputDecoration(
//           labelText: 'Name',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // eMailTitle() {
//   eMailTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _eMailController,
//         decoration: InputDecoration(
//           labelText: 'E-Mail',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (val) {
//           if (val == null || !EmailValidator.validate(val)) {
//             return 'Please enter a valid email';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // numberTitle() {
//   numberTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: _mobileController,
//         decoration: InputDecoration(
//           labelText: 'Number',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           } else if (int.tryParse(value) == null) {
//             return 'The entered value should be a number';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // ageTitle() {
//   ageTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: _ageController,
//         decoration: InputDecoration(
//           labelText: 'Age',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           } else if (int.tryParse(value) == null) {
//             return 'The entered value should be a number';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // jobDiscriptionTitle() {
//   jobDiscriptionTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _jobDiscriptionController,
//         decoration: InputDecoration(
//           labelText: 'Job Discription',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   // salaryTitle() {
//   salaryTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: _salaryController,
//         decoration: InputDecoration(
//           labelText: 'Salary',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           } else if (int.tryParse(value) == null) {
//             return 'The entered value should be a number';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   createNewUser() {
//     return GestureDetector(
//       onTap: confirmAddUser,
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.deepPurple,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Center(
//           child: Text(
//             'S U B M I T',
//             style: GoogleFonts.merienda(
//               color: Colors.white,
//               fontSize: 17,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CompanyDetails extends StatefulWidget {
//   final GlobalKey<FormState> formKey;
//   const CompanyDetails({super.key, required this.formKey});

//   @override
//   State<CompanyDetails> createState() => _CompanyDetailsState();
// }

// class _CompanyDetailsState extends State<CompanyDetails> {
//   final FirestoreService firestoreService = FirestoreService();
//   final _formKey = GlobalKey<FormState>();

//   final _companyNameController = TextEditingController();
//   final _companyEmailController = TextEditingController();
//   final _companyNumberController = TextEditingController();
//   final _companyAddressController = TextEditingController();
//   final _companyDiscriptionController = TextEditingController();

//   @override
//   void dispose() {
//     _companyNameController.dispose();
//     _companyEmailController.dispose();
//     _companyNumberController.dispose();
//     _companyAddressController.dispose();
//     _companyDiscriptionController.dispose();

//     super.dispose();
//   }

//   confirmAddCompany() {
//     print("Submitting user data");
//     if (_formKey.currentState?.validate() ?? false) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return DialogBox(
//               dialog: 'Are You Sure, You wanna Create a new Company',
//               onClickSave: () {
//                 firestoreService.addCompany(
//                   _companyNameController.text,
//                   _companyEmailController.text,
//                   _companyNameController.text,
//                   _companyAddressController.text,
//                   _companyDiscriptionController.text,
//                 );
//                 Fluttertoast.showToast(
//                   msg: 'The Company has Added Successfully',
//                   toastLength: Toast.LENGTH_LONG,
//                   gravity: ToastGravity.SNACKBAR,
//                   backgroundColor: Colors.black54,
//                   textColor: Colors.white,
//                 );

//                 Navigator.pop(context);
//                 Navigator.pop(context);
//               },
//             );
//           });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // nameTitle(),
//         companyNameTextField(),
//         // eMailTitle(),
//         companyEmailTextField(),
//         // numberTitle(),
//         companyNumberTextField(),
//         // ageTitle(),
//         companyAddressTextField(),
//         // jobDiscriptionTitle(),
//         companyDiscriptionTextField(),
//         const SizedBox(height: 15),
//         createNewCompany(),
//       ],
//     );
//   }

//   companyNameTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _companyNameController,
//         decoration: InputDecoration(
//           labelText: 'Company Name',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   companyEmailTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _companyEmailController,
//         decoration: InputDecoration(
//           labelText: 'Company Email',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (val) {
//           EmailValidator.validate(val!) ? null : 'Please enter valid e-mail';
//           return null;
//         },
//       ),
//     );
//   }

//   companyNumberTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: _companyNumberController,
//         decoration: InputDecoration(
//           labelText: 'Company Number',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           } else if (int.tryParse(value) == null) {
//             return 'The entered value should be a number';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   companyAddressTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _companyAddressController,
//         decoration: InputDecoration(
//           labelText: 'Company Address',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   companyDiscriptionTextField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, bottom: 10),
//       child: TextFormField(
//         controller: _companyDiscriptionController,
//         decoration: InputDecoration(
//           labelText: 'Company Discription',
//           labelStyle: GoogleFonts.merienda(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   createNewCompany() {
//     return GestureDetector(
//       onTap: confirmAddCompany,
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.deepPurple,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Center(
//           child: Text(
//             'S U B M I T',
//             style: GoogleFonts.merienda(
//               color: Colors.white,
//               fontSize: 17,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
