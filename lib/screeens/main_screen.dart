import 'package:flutter/material.dart';
import 'package:smartshop/screeens/account_screen.dart';
import 'package:smartshop/screeens/cart_screen.dart';
import 'package:smartshop/screeens/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0; // Set initial value to 0 for the "Home" screen

  final List<Widget> screens = [
    const Screens(), // "Home" screen
    const Scaffold(), // Placeholder screens for demonstration
    const Scaffold(),
    const Cartscreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentTab = 0; // Set currentTab to 0 for the "Home" screen
          });
        },
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 241, 137, 33),
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 70,
        color: const Color.fromARGB(255, 227, 225, 225),
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => setState(() {
                currentTab = 1; // Set currentTab to 0 for the "Home" screen
              }),
              icon: const Icon(Icons.girl_sharp),
              color: currentTab == 1
                  ? const Color.fromARGB(255, 247, 112, 27)
                  : null,
            ),
            IconButton(
              onPressed: () => setState(() {
                currentTab = 2;
              }),
              icon: const Icon(Icons.chat),
              color: currentTab == 2
                  ? const Color.fromARGB(255, 241, 106, 33)
                  : null,
            ),
            IconButton(
              onPressed: () => setState(() {
                currentTab = 3;
              }),
              icon: const Icon(Icons.shopping_cart),
              color: currentTab == 3
                  ? const Color.fromARGB(255, 248, 136, 61)
                  : null,
            ),
            IconButton(
              onPressed: () => setState(() {
                currentTab = 4;
              }),
              icon: const Icon(Icons.person_2_outlined),
              color: currentTab == 4
                  ? const Color.fromARGB(255, 243, 117, 34)
                  : null,
            ),
          ],
        ),
      ),
      body: screens[currentTab],
    );
  }
}
