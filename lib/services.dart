// ignore_for_file: depend_on_referenced_packages, avoid_print, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Myservices extends StatefulWidget {
  const Myservices({super.key});

  @override
  State<Myservices> createState() => _MyservicesState();
}

class _MyservicesState extends State<Myservices> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> serviceData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://172.20.10.2:3000/api/services'));

      if (response.statusCode == 200) {
        // Parse the response body
        final dynamic responseData = json.decode(response.body);

        if (responseData.containsKey('users')) {
          final List<dynamic> users = responseData['users'];

          setState(() {
            serviceData = users
                .map((data) => {
                      'name': data['name'],
                      'details': data['services'],
                      'phoneno': data['number'].toString(),
                      'Area': data['address'],
                    })
                .toList();
          });
        } else {
          print('Invalid response format: Missing "users" key');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircularContainerWithText(
                      imageasset: 'images/shearing.jpeg',
                      details: 'Shearing',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/sortingandgrading.jpeg',
                      details: 'Sorting and grading',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/scouringg.jpeg',
                      details: 'Scouring',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/combingandcarding.jpeg',
                      details: 'Carding and Combing',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/spinning.jpeg',
                      details: 'Spinning',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/dyeing.jpeg',
                      details: 'Dyeing',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/weaving.jpeg',
                      details: 'Weaving',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/cuttingandsewing.jpeg',
                      details: 'Cutting and sewing',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/packaging.jpeg',
                      details: 'Packaging',
                    ),
                    SizedBox(width: 16),
                    CircularContainerWithText(
                      imageasset: 'images/overall.jpeg',
                      details: 'Overall',
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: serviceData.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Handle button tap
                      print('Service tapped!');
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 240, 240, 240),
                      ),
                      child: ListTile(
                        title: Text(
                          serviceData[index]['name'],
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 19,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Services Offered: " +
                                  serviceData[index]['details'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "Contact: " + serviceData[index]['phoneno'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "Area: " + serviceData[index]['Area'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            // Add more details as needed
                          ],
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularContainerWithText extends StatelessWidget {
  final String imageasset;
  final String details;

  const CircularContainerWithText({
    super.key,
    required this.imageasset,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print('Card tapped!');
          },
          child: Card(
            elevation: 10,
            shape: const CircleBorder(),
            child: Container(
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      imageasset,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          details,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
