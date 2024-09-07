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
// //         backgroundColor: Colors.amber,
// //         title: const Text(
// //           'User Details',
// //           style: TextStyle(fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //       ),
// //       floatingActionButton: FloatingActionButton.extended(
// //         onPressed: () {},
// //         label: const Text('Edit'),
// //         backgroundColor: Colors.amber,
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
// //               color: Colors.amber[100],
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
//         backgroundColor: Colors.amber,
//         title: const Text(
//           'User Details',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         label: const Text('Edit'),
//         backgroundColor: Colors.amber,
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
//               color: Colors.amber[100],
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
//         backgroundColor: Colors.amber,
//         title: const Text(
//           'User Details',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         label: const Text('Edit'),
//         backgroundColor: Colors.amber,
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
//               color: Colors.amber[100],
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
