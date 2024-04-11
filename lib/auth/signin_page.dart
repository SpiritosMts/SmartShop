import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:smartshop/bindings.dart';
import 'package:smartshop/main.dart';
import 'package:smartshop/screeens/main_screen.dart';


class Loginpage extends StatefulWidget {
  final String initialEmail;
  final String initialPassword;

  const Loginpage({
    Key? key,
    this.initialEmail = '',
    this.initialPassword = '',
  }) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialEmail);
    _passwordController = TextEditingController(text: widget.initialPassword);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }




  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with sign in
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        authCtr.RefreshUserByEmail(email);//get user from firebase
      } catch (error) {
        print("Error signing in: $error");

        print("Error signing in: $error");
        // Handle sign-in errors here
        String errorMessage = 'An error occurred. Please try again.';

        if (error is FirebaseAuthException) {
          if (error.code == 'user-not-found') {
            errorMessage = 'No user found with this email.';
          } else if (error.code == 'wrong-password') {
            errorMessage = 'Incorrect password provided for this email.';
          }
        }

        // Show a red snack bar with the error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red.withOpacity(.8),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 249),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey, // Set GlobalKey to the form
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'assets/images/datadoit.png',
                      height: 150,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Welcome back',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!value.contains('@')) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 44),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () => signInWithEmailAndPassword(context),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 138, 245),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Color.fromARGB(255, 252, 247, 247),
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not yet a member?  '),
                        GestureDetector(
                          onTap: () => openSignup(context),
                          child: const Text(
                            'Sign up Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromARGB(255, 190, 104, 203),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
