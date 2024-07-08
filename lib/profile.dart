// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      final response =
          await http.get(Uri.parse('http://172.20.10.2:3000/api/profile'));

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);

        setState(() {
          userData = responseData['user'];
        });
      } else {
        print('Failed to load profile data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching profile data: $error');
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    //double containerWidth = screenWidth * 0.92;
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Card(
                  elevation: 10,
                  shape: const CircleBorder(),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: Image.asset(
                        'images/profilepic.png',
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Name: ${userData['name']}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Number: ${userData['number']}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Address: ${userData['address']}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Card(
          //   elevation: 10,
          //   shape: null,
          //   color: const Color.fromARGB(255, 240, 238, 238),
          //   child: Container(
          //     width: containerWidth,
          //     height: 60,
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         const Text(
          //           "Your Orders",
          //           style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(
          //             left: containerWidth * 0.35,
          //           ),
          //           child: IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.arrow_right,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          // Card(
          //   elevation: 10,
          //   shape: null,
          //   color: const Color.fromARGB(255, 240, 238, 238),
          //   child: Container(
          //     width: containerWidth,
          //     height: 60,
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         const Text(
          //           "Your Products",
          //           style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(
          //             left: containerWidth * 0.35,
          //           ),
          //           child: IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.arrow_right,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          // Card(
          //   elevation: 10,
          //   shape: null,
          //   color: const Color.fromARGB(255, 240, 238, 238),
          //   child: Container(
          //     width: containerWidth,
          //     height: 60,
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         const Text(
          //           "Your Services",
          //           style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(
          //             left: containerWidth * 0.35,
          //           ),
          //           child: IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.arrow_right,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ));
  }
}
