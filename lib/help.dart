// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class helpPage extends StatefulWidget {
  const helpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _helpPageState createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
  TextEditingController helpController = TextEditingController();
  // TextEditingController expiryDateController = TextEditingController();
  // TextEditingController cvvController = TextEditingController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 34, 183, 61),
        title: const Row(
          children: [
            FlutterLogo(),
            SizedBox(width: 12.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 67, 188, 84),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.pushNamed(context, "homepage");
              break;
            case 1:
              Navigator.pushNamed(context, "cartscreen");
              break;
            case 2:
              Navigator.pushNamed(context, "profile");
              break;
            case 3:
              Navigator.pushNamed(context, "settings");
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_max_outlined,
              color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            label: "Settings",
          )
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please mention the issue with us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: helpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Type here',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // ignore: avoid_print
                print('Help: ${helpController.text}');
              },
              child: const Text('Thank You!'),
            ),
          ],
        ),
      ),
    );
  }
}
