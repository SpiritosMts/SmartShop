import 'package:app_settings/app_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartshop/models/user.dart';
import 'package:smartshop/screeens/Myprofile.dart';
import 'package:smartshop/screeens/main_screen.dart';
import 'package:smartshop/screeens/package/project11/screeens/alert_dialog.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../userProvider.dart';

// ignore: must_be_immutable
class AccountScreen extends StatefulWidget {

  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String title = 'AlertDialog';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 80),
          ListTile(
            leading: const Icon(Icons.account_circle,
                size: 30, color: Colors.orange),
            title: const Text('My Account'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileEdit()),
              );
            },
          ),
          const SizedBox(height: 45), // Add SizedBox
          ListTile(
            leading:
                const Icon(Icons.notifications, size: 30, color: Colors.orange),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
          ),
          const SizedBox(height: 45), // Add SizedBox
          ListTile(
            leading: const Icon(Icons.settings, size: 30, color: Colors.orange),
            title: const Text('Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              AppSettings.openAppSettings(
                  type: AppSettingsType.device, asAnotherTask: true);
            },
          ),
          const SizedBox(height: 45), // Add SizedBox
          ListTile(
            leading: const Icon(Icons.help, size: 30, color: Colors.orange),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle the tap
            },
          ),
          const SizedBox(height: 45), // Add SizedBox
          ListTile(
            leading:
                const Icon(Icons.exit_to_app, size: 30, color: Colors.orange),
            title: const Text('Log Out'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              final action = await AlertDialogs.yesCancelDialog(
                  context, 'log_out', 'are you sure?');
            },
          ),
        ],
      ),
    );
  }
}
