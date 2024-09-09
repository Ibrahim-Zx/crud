import 'package:crud/services/firestore.dart';
import 'package:crud/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPage extends StatefulWidget {
  final String docID;
  const EditPage({
    super.key,
    required this.docID,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final FirestoreService firestoreService = FirestoreService();
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _eMailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _ageController = TextEditingController();
  final _jobDiscriptionController = TextEditingController();
  final _salaryController = TextEditingController();

  updateData() async {
    Map<String, dynamic> updatedInfo = {
      'Name': _nameController.text,
      'Email': _eMailController.text,
      'Mobile': _mobileController.text,
      'Age': _ageController.text,
      'Job Discription': _jobDiscriptionController.text,
      'Salary': _salaryController.text,
    };
    await firestoreService
        .updateUser(
      docID: widget.docID,
      updatedInfo: updatedInfo,
    )
        .then((onValue) {
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: 'The User has Updated Successfully',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
      );
      Navigator.pop(context);
    });
  }

  confirmUpdateUser() {
    if (_formKey.currentState?.validate() ?? false) {
      // Process data if form is valid
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              dialog: 'Are You Sure, You wanna Update the existing user',
              onClickSave: updateData,
            );
          });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _eMailController.dispose();
    _ageController.dispose();
    _mobileController.dispose();
    _jobDiscriptionController.dispose();
    _salaryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Edit User Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // nameTitle(),
                nameTextField(),
                // eMailTitle(),
                eMailTextField(),
                // numberTitle(),
                numberTextField(),
                // ageTitle(),
                ageTextField(),
                // jobDiscriptionTitle(),
                jobDiscriptionTextField(),
                // salaryTitle(),
                salaryTextField(),
                const SizedBox(height: 15),
                updateUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // nameTitle() {
  //   return const Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Name',
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ],
  //   );
  // }

  nameTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  // eMailTitle() {
  //   return const Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Text(
  //         'E-Mail',
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ],
  //   );
  // }

  eMailTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _eMailController,
        decoration: InputDecoration(
          labelText: 'E-Mail',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  // numberTitle() {
  //   return const Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Number',
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ],
  //   );
  // }

  numberTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _mobileController,
        decoration: InputDecoration(
          labelText: 'Number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          } else if (value != int) {
            return 'The entered value should be a number';
          }
          return null;
        },
      ),
    );
  }

  // ageTitle() {
  //   return const Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Age',
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ],
  //   );
  // }

  ageTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _ageController,
        decoration: InputDecoration(
          labelText: 'Age',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          } else if (value != int) {
            return 'The entered value should be a number';
          }
          return null;
        },
      ),
    );
  }

  // jobDiscriptionTitle() {
  //   return const Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Job Discription',
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ],
  //   );
  // }

  jobDiscriptionTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _jobDiscriptionController,
        decoration: InputDecoration(
          labelText: 'Job Discription',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  // salaryTitle() {
  //   return const Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Salary',
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ],
  //   );
  // }

  salaryTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _salaryController,
        decoration: InputDecoration(
          labelText: 'Salary',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          } else if (value != int) {
            return 'The entered value should be a number';
          }
          return null;
        },
      ),
    );
  }

  updateUser() {
    return GestureDetector(
      onTap: confirmUpdateUser,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'U P D A T E',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
