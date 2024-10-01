import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/services/firestore.dart';
import 'package:crud/util/dialog_box.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPage extends StatefulWidget {
  final String docID;
  final int selectedSlider;
  const EditPage({
    super.key,
    required this.docID,
    required this.selectedSlider,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final FirestoreService firestoreService = FirestoreService();
  final _customerFormKey = GlobalKey<FormState>();
  final _companyFormKey = GlobalKey<FormState>();

  Future<DocumentSnapshot> getCustomerDocument(String docID) async {
    return FirebaseFirestore.instance.collection('users').doc(docID).get();
  }

  Future<DocumentSnapshot> getCompanyDocument(String docID) async {
    return FirebaseFirestore.instance.collection('company').doc(docID).get();
  }

  late TextEditingController _nameController;
  late TextEditingController _eMailController;
  late TextEditingController _mobileController;
  late TextEditingController _ageController;
  late TextEditingController _jobDiscriptionController;
  late TextEditingController _salaryController;
  late TextEditingController _companyNameController;
  late TextEditingController _companyEmailController;
  late TextEditingController _companyNumberController;
  late TextEditingController _companyAddressController;
  late TextEditingController _companyDiscriptionController;

  selected() {
    if (widget.selectedSlider == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _eMailController = TextEditingController();
    _mobileController = TextEditingController();
    _ageController = TextEditingController();
    _jobDiscriptionController = TextEditingController();
    _salaryController = TextEditingController();
    _companyNameController = TextEditingController();
    _companyEmailController = TextEditingController();
    _companyNumberController = TextEditingController();
    _companyAddressController = TextEditingController();
    _companyDiscriptionController = TextEditingController();

    selected() ? _loadCustomerData() : _loadCompanyData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _eMailController.dispose();
    _ageController.dispose();
    _mobileController.dispose();
    _jobDiscriptionController.dispose();
    _salaryController.dispose();
    _companyNameController.dispose();
    _companyEmailController.dispose();
    _companyNumberController.dispose();
    _companyAddressController.dispose();
    _companyDiscriptionController.dispose();

    super.dispose();
  }

  Future<void> _loadCustomerData() async {
    DocumentSnapshot customerDoc = await getCustomerDocument(widget.docID);
    _nameController.text = customerDoc['Name'];
    _eMailController.text = customerDoc['Email'];
    _mobileController.text = customerDoc['Mobile'];
    _ageController.text = customerDoc['Age'];
    _jobDiscriptionController.text = customerDoc['Job Discription'];
    _salaryController.text = customerDoc['Salary'];
  }

  Future<void> _loadCompanyData() async {
    DocumentSnapshot companyDoc = await getCompanyDocument(widget.docID);
    _companyNameController.text = companyDoc['Company Name'];
    _companyEmailController.text = companyDoc['Company Email'];
    _companyNumberController.text = companyDoc['Company Mobile'];
    _companyAddressController.text = companyDoc['Company Address'];
    _companyDiscriptionController.text = companyDoc['Company Discription'];
  }

  updateUserData() async {
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

  updateCompanyData() async {
    Map<String, dynamic> updatedInfo = {
      'Company Name': _companyNameController.text,
      'Company Email': _companyEmailController.text,
      'Company Mobile': _companyNumberController.text,
      'Company Address': _companyAddressController.text,
      'Company Discription': _companyDiscriptionController.text,
    };
    await firestoreService
        .updateCompany(
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
    if (_customerFormKey.currentState?.validate() ?? false) {
      // Process data if form is valid
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            dialog: 'Are You Sure, You wanna Update the existing user',
            onClickSave: updateUserData,
          );
        },
      );
    }
  }

  confirmUpdateCompany() {
    if (_companyFormKey.currentState?.validate() ?? false) {
      // Process data if form is valid
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            dialog: 'Are You Sure, You wanna Update the existing user',
            onClickSave: updateCompanyData,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Edit User Details',
          style: GoogleFonts.merienda(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: widget.selectedSlider == 0,
                child: Form(
                  key: _customerFormKey,
                  child: Column(
                    children: [
                      nameTextField(),
                      eMailTextField(),
                      numberTextField(),
                      ageTextField(),
                      jobDiscriptionTextField(),
                      salaryTextField(),
                      const SizedBox(height: 15),
                      updateUser(),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: widget.selectedSlider == 1,
                child: Form(
                  key: _companyFormKey,
                  child: Column(
                    children: [
                      companyNameTextField(),
                      companyEmailTextField(),
                      companyNumberTextField(),
                      companyAddressTextField(),
                      companyDiscriptionTextField(),
                      const SizedBox(height: 15),
                      updateCompany(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  nameTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: 'Name',
          labelStyle: GoogleFonts.merienda(),
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

  eMailTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _eMailController,
        decoration: InputDecoration(
          labelText: 'E-Mail',
          labelStyle: GoogleFonts.merienda(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          final bool isValid = EmailValidator.validate(value.toString().trim());

          if (!isValid) {
            return 'Enter a valid e-mail';
          }
          return null;
        },
      ),
    );
  }

  numberTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _mobileController,
        decoration: InputDecoration(
          labelText: 'Number',
          labelStyle: GoogleFonts.merienda(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          } else if (int.tryParse(value) == null) {
            return 'The entered value should be a number';
          }
          return null;
        },
      ),
    );
  }

  ageTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _ageController,
        decoration: InputDecoration(
          labelText: 'Age',
          labelStyle: GoogleFonts.merienda(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          } else if (int.tryParse(value) == null) {
            return 'The entered value should be a number';
          }
          return null;
        },
      ),
    );
  }

  jobDiscriptionTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _jobDiscriptionController,
        decoration: InputDecoration(
          labelText: 'Job Discription',
          labelStyle: GoogleFonts.merienda(),
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

  salaryTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _salaryController,
        decoration: InputDecoration(
          labelText: 'Salary',
          labelStyle: GoogleFonts.merienda(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          } else if (int.tryParse(value) == null) {
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
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'U P D A T E',
            style: GoogleFonts.merienda(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  companyNameTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _companyNameController,
        decoration: InputDecoration(
          labelText: 'Company Name',
          labelStyle: GoogleFonts.merienda(),
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

  companyEmailTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _companyEmailController,
        decoration: InputDecoration(
          labelText: 'Company Email',
          labelStyle: GoogleFonts.merienda(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (val) {
          if (val == null || !EmailValidator.validate(val)) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }

  companyNumberTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _companyNumberController,
        decoration: InputDecoration(
          labelText: 'Company Number',
          labelStyle: GoogleFonts.merienda(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          } else if (int.tryParse(value) == null) {
            return 'The entered value should be a number';
          }
          return null;
        },
      ),
    );
  }

  companyAddressTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _companyAddressController,
        decoration: InputDecoration(
          labelText: 'Company Address',
          labelStyle: GoogleFonts.merienda(),
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

  companyDiscriptionTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: TextFormField(
        controller: _companyDiscriptionController,
        decoration: InputDecoration(
          labelText: 'Company Discription',
          labelStyle: GoogleFonts.merienda(),
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

  updateCompany() {
    return GestureDetector(
      onTap: confirmUpdateCompany,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'U P D A T E',
            style: GoogleFonts.merienda(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
