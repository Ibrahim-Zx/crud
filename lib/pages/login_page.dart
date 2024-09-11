import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _eMailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _eMailController.text.toString(),
        password: _passwordController.text.toString(),
      );
    } on FirebaseAuthException catch (ex) {
      String msg;

      if (ex.code == 'invalid-credential') {
        msg = 'The entered e-mail or password is wrong';
      } else if (ex.code == 'invalid-email') {
        msg = 'Invalid e-mail address, Give a proper e-mail address';
      } else {
        msg = ex.code;
      }

      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //icon
                const Icon(
                  Icons.supervised_user_circle,
                  size: 120,
                ),
                const SizedBox(height: 30),

                //Hello & Welcome back text
                Text(
                  'WELCOME!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 30),

                //Username Textfield
                const Row(
                  children: [
                    Text(
                      'Enter e-mail',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 5),
                  child: TextField(
                    controller: _eMailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.deepPurple[200],
                      hintText: 'e-mail or mobile number',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                //Password Textbox
                const Row(
                  children: [
                    Text(
                      'Enter Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 5),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.deepPurple[200],
                      hintText: 'password',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                //Sign in button
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
