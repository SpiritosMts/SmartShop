import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smartshop/logo.dart';
import 'package:smartshop/screeens/main_screen.dart';


import 'auth/authCtr.dart';
import 'auth/signin_page.dart';
import 'bindings.dart';
import 'firebase_options.dart';


final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
generalAppbar(title, context) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    leadingWidth: 60,
//     leading: Padding(
//       padding: const EdgeInsets.only(left: 5),
//       child: IconButton(
//         onPressed: () {
// Get.back();
//           //Get.offAll(()=>MainScreen());
//         },
//         style: IconButton.styleFrom(backgroundColor: const Color.fromARGB(255, 211, 206, 206)),
//         padding: const EdgeInsets.all(15),
//         icon: const Icon(Icons.chevron_left_outlined),
//       ),
//     ),
  );
}

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
  Fluttertoast.showToast(
    msg: 'Welcome Back ${cUser.name }',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green.withOpacity(.6),
    textColor: Colors.white,
    fontSize: 16.0,
  );
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

  // ScaffoldMessenger.of(context)
  //   ..hideCurrentSnackBar()
  //   ..showSnackBar(snackBar);
}
void openSignup(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('signup');
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized(); //don't touch

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp(),);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
      title: 'Smart Shop',

      initialBinding: GetxBinding(),

      theme: ThemeData(),

      getPages: [
        GetPage(name: '/', page: () =>Logo() ),
      ],
    );
  }
}
