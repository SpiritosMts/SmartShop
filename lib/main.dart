//import 'package:flutter/cupertino.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartshop/logo.dart';
//import 'package:smartshop/logo.dart';
import 'package:smartshop/screeens/account_screen.dart';
import 'package:smartshop/screeens/main_screen.dart';
//import 'package:smartshop/screeens/main_screen.dart';
//import 'package:smartshop/screeens/screens.dart';
import 'package:smartshop/signin_page.dart';
import 'package:smartshop/signup.dart';

import 'firebase_options.dart';
import 'userProvider.dart';
//import 'package:smartshop/screeens/main_screen.dart';
//import 'package:smartshop/signup.dart';
//import 'package:smartshop/welcome_screen.dart';
//import 'package:smartshop/screeens/main_screen.dart';

//import 'package:project11/login_page.dart';
//import 'package:project11/screeens/main_screen.dart';
//import 'package:project11/screeens/screens.dart';
//import 'package:project11/screeens/screens.dart';
//import 'package:project11/screeens/screens.dart';
//import 'package:project11/screeens/screens.dart';
//import 'package:project11/screeens/account_screen.dart';
//import 'package:project11/screeens/cart_screen.dart';
//import 'package:project11/screeens/main_screen.dart';
//import 'package:project11/signup.dart';
//import 'package:project11/screeens/screens.dart';
//import 'package:project11/screeens/main_screen.dart';
//import 'package:project11/login_page.dart';
//import 'package:project11/screeens/product_screens.dart';
//import 'package:project11/screeens/screens.dart';


final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
void openLoginpage(BuildContext context,email,pwd) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Loginpage(
        initialEmail: email,
        initialPassword: pwd,
      ),
    ),
  );}

void openMainScreen(BuildContext context) {

  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen())).then((value) {

  });
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,

    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Login success',
      message:'Welcome Back ${cUser.name }',
      titleFontSize: 18,
      contentType: ContentType.success,
      color: Colors.green,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
void openSignup(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('signup');
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized(); //don't touch

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModelProvider(),
      child: MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const Logo(),
        routes: {
          'signup': (context) => const Signup(),
          // 'HomeAppBar': (context) => const HomeAppBar(),
          'Signin': (context) => const Loginpage(), // Change 'signin' to 'Signin'
        });
  }
}
