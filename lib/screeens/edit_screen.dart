import 'package:flutter/material.dart';
import 'package:smartshop/screeens/edititem.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  Color? _maleBackgroundColor;
  Color? _femaleBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check,
                color: Color.fromARGB(255, 202, 122, 4),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Photo",
                style: TextStyle(color: Colors.grey),
              ),
              Center(
                child: EditItem(
                  title: "Photo",
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color.fromARGB(255, 237, 227, 243),
                        backgroundImage: AssetImage(
                          "assets/images/femaleicon.png",
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 238, 105, 231),
                        ),
                        child: const Text(
                          "Upload Image",
                          style: TextStyle(
                              color: Color.fromARGB(255, 237, 126, 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                        // Your TextField widget here
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _maleBackgroundColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _maleBackgroundColor = Colors.orange;
                          _femaleBackgroundColor = null;
                        });
                      },
                      icon:
                          const Icon(Icons.male, size: 30, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _femaleBackgroundColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _femaleBackgroundColor =
                              const Color.fromARGB(255, 218, 131, 234);
                          _maleBackgroundColor = null;
                        });
                      },
                      icon: const Icon(Icons.female,
                          size: 30, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Row(
                children: [
                  Text(
                    "Age",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: TextField(
                        // Your TextField widget here
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: TextField(
                        // Your TextField widget here
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
