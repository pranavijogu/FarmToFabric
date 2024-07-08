// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  TextEditingController housenoController = TextEditingController();
  TextEditingController laneController = TextEditingController();
  TextEditingController cityController = TextEditingController();

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
              'House number',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: housenoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'House number',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lane',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: laneController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                hintText: 'Lane',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'City',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: cityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter City',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                print('House number: ${housenoController.text}');
                print('Lane: ${laneController.text}');
                print('City: ${cityController.text}');
              },
              child: const Text('Enter Address'),
            ),
          ],
        ),
      ),
    );
  }
}
