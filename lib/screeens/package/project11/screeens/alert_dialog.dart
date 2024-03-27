import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartshop/logo.dart';
import 'package:smartshop/screeens/screens.dart';

import '../../../../main.dart';
import '../../../../models/user.dart';
import '../../../../userProvider.dart';

enum DialogsAction { yes, cancel }
void logout(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    Provider.of<UserModelProvider>(navKey.currentContext!, listen: false).currentUser = UserModel();//empty user
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Logo()),
    );
  } catch (error) {
    print('Error signing out: $error');
    // Handle sign-out errors here
  }
}
class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navigate back to the Screens screen
                logout(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(DialogsAction.cancel);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );

    return action ?? DialogsAction.cancel;
  }
}
