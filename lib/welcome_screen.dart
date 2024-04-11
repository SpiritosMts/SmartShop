import 'package:flutter/material.dart';
import 'package:smartshop/auth/signup.dart';

import 'auth/signin_page.dart'; // Import the signup page

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  Color _loginButtonColor = const Color.fromARGB(255, 218, 119, 233);
  Color _signupButtonColor = Colors.transparent;

  void _setLoginButtonColor() {
    setState(() {
      _loginButtonColor = const Color.fromARGB(255, 218, 119, 233);
      _signupButtonColor = Colors.transparent;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Loginpage()), // Navigate to LoginPage
    );
  }

  void _setSignupButtonColor() {
    setState(() {
      _loginButtonColor = Colors.transparent;
      _signupButtonColor = const Color.fromARGB(255, 218, 119, 233);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Signup()), // Navigate to SignupPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 249),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                // Logo pic
                const SizedBox(
                  height: 200,
                ),
                Image.asset(
                  'assets/images/datadoit.png',
                  height: 150,
                ),

                const Text(
                  'Smart shop',
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 13, 13),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 70, // Added spacing
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: _setLoginButtonColor,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _loginButtonColor,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: const Color.fromARGB(255, 218, 119, 233),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: _loginButtonColor != Colors.transparent
                                ? Colors.white
                                : Colors
                                    .black, // Dynamic text color based on button color
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: _setSignupButtonColor,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: _signupButtonColor,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: const Color.fromARGB(255, 218, 119, 233),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: _signupButtonColor != Colors.transparent
                                ? Colors.white
                                : Colors
                                    .black, // Dynamic text color based on button color
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
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
