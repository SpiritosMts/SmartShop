import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'models/user.dart'; // Import Cloth class
UserModel cUser = Provider.of<UserModelProvider>(navKey.currentContext!).currentUser!;//get


RefreshUserByEmail(email) async {

  final userSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: email)
      .get();

  if (userSnapshot.docs.isNotEmpty) {
    final userData = userSnapshot.docs.first.data();
    UserModel usrFound = UserModel.fromJson(userData);
    Provider.of<UserModelProvider>(navKey.currentContext!, listen: false).currentUser = usrFound;/// save user found to provider
    openMainScreen(navKey.currentContext!);/// go home

  } else {
    SnackBar(
      content: Text('User not found in database'),
      backgroundColor: Colors.red.withOpacity(.8),
    );
}
}

class UserModelProvider extends ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  set currentUser(UserModel? user) {
    ///Provider.of<UserModelProvider>(navKey.currentContext!, listen: false).currentUser = user;//set

    _currentUser = user;
    notifyListeners(); // Notify listeners when user changes
  }
}
