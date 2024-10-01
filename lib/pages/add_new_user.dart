// ignore_for_file: unrelated_type_equality_checks

import 'package:crud/services/firestore.dart';
import 'package:crud/util/dialog_box.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({super.key});

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  final FirestoreService firestoreService = FirestoreService();
  final _customerFormKey = GlobalKey<FormState>();
  final _companyFormKey = GlobalKey<FormState>();
  int selectedRadio = 1;

  void setSelectedRadio(int value) {
    setState(() {
      selectedRadio = value;
    });
  }

  final _nameController = TextEditingController();
  final _eMailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _ageController = TextEditingController();
  final _jobDiscriptionController = TextEditingController();
  final _salaryController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _companyEmailController = TextEditingController();
  final _companyNumberController = TextEditingController();
  final _companyAddressController = TextEditingController();
  final _companyDiscriptionController = TextEditingController();

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

  confirmAddUser() {
    if (_customerFormKey.currentState?.validate() ?? false) {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              dialog: 'Are You Sure, You wanna Create a new user',
              onClickSave: () {
                firestoreService.addUser(
                  _nameController.text,
                  _eMailController.text,
                  _mobileController.text,
                  _ageController.text,
                  _jobDiscriptionController.text,
                  _salaryController.text,
                );
                Fluttertoast.showToast(
                  msg: 'The User has Added Successfully',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.SNACKBAR,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                );

                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
          });
    }
  }

  confirmAddCompany() {
    if (_companyFormKey.currentState?.validate() ?? false) {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              dialog: 'Are You Sure, You wanna Create a new Company',
              onClickSave: () {
                firestoreService.addCompany(
                  _companyNameController.text,
                  _companyEmailController.text,
                  _companyNameController.text,
                  _companyAddressController.text,
                  _companyDiscriptionController.text,
                );
                Fluttertoast.showToast(
                  msg: 'The Company has Added Successfully',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.SNACKBAR,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                );

                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Add New User',
          style: GoogleFonts.merienda(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 25,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: const Text(
                        'User',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setSelectedRadio(value as int);
                          }),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: const Text(
                        'Company',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio(
                          value: 2,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setSelectedRadio(value as int);
                          }),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: selectedRadio == 1,
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
                      createNewUser(),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: selectedRadio == 2,
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
                      createNewCompany(),
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
        validator: (val) {
          if (val == null || !EmailValidator.validate(val)) {
            return 'Please enter a valid email';
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

  createNewUser() {
    return GestureDetector(
      onTap: confirmAddUser,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'S U B M I T',
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

  createNewCompany() {
    return GestureDetector(
      onTap: confirmAddCompany,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'S U B M I T',
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
