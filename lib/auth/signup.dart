import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:smartshop/screeens/main_screen.dart';
import 'package:uuid/uuid.dart'; // Import the uuid package

import '../main.dart';
import '../models/user.dart'; // Import the MainScreen

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form

  String getCurrentFormattedDate() {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm , dd MMMM yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }


  Future<void> addNewUserModel(BuildContext context) async {
    // Validate form fields and other necessary validations

    try {
      // Create user in Firebase Authentication
      String userId = Uuid().v4();

      // Assuming you have retrieved the necessary user data (id, name, email, etc.)
      UserModel newUser = UserModel(
        id: userId, // You can generate a unique ID for the user or use the one provided by Firebase Authentication
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        pwd: _passwordController.text.trim(),
        phone: '',
        address: '',
        joinDate: getCurrentFormattedDate(),
        verified: true,
        cart: [], // Initialize an empty cart for the user
      );

      // Add the user data to the 'users' collection in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).set(newUser.toJson());

      // Navigate to the main screen or perform other necessary actions
    } catch (error) {
      // Handle errors
    }
  }

  Future<void> signUpWithEmailAndPassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with signup
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ).then((value) {
          addNewUserModel(context).then((value) {
            openLoginpage(context,email,password);
          });///add to 'users' collection
        });
      } catch (error) {
        print("Error signing up: $error");
        // Handle sign-up errors here
        String errorMessage = 'An error occurred. Please try again.';

        if (error is FirebaseAuthException) {
          if (error.code == 'weak-password') {
            errorMessage = 'The password provided is too weak.';
          } else if (error.code == 'email-already-in-use') {
            errorMessage = 'The account already exists for that email.';
          }
        }

        // Show a red snack bar with the error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red.withOpacity(.8),
          ),
        );      }
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
                    const SizedBox(height: 20),
                    const Text(
                      'SIGN UP',
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
                      'Hello new user :8 ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                          // Regular expression for email validation
                          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: 'Confirm Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please re-enter your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: GestureDetector(
                        onTap: () => signUpWithEmailAndPassword(context),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 200, 49, 223),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 252, 247, 247),
                                  fontSize: 17,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not yet a member?  '),
                        GestureDetector(
                          onTap: () => openLoginpage(context,'',''),
                          child: const Text(
                            'Sign in Now',
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
