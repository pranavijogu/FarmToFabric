// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Mywarehouses extends StatefulWidget {
  const Mywarehouses({super.key});

  @override
  State<Mywarehouses> createState() => _MywarehousesState();
}

class _MywarehousesState extends State<Mywarehouses> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "/Users/pranavi/Downloads/76001786-7716-4C22-B5E2-25AEF3DDC2D6.JPEG",
            ),
            fit: BoxFit.cover,
          ),
        ),
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
          body: ContainerList(),
        ));
  }
}

class ContainerList extends StatelessWidget {
  final List<Map<String, String>> containerData = [
    {
      'title': 'ABC Wools-Knitting Crochet Yarn Wool Store',
      'subtext': 'Jodhput,Rajasthan',
      'image': 'images/warehouse3.png',
      'directionsUrl': 'https://maps.app.goo.gl/Lx18SScZnfUKCA9e6',
      'phoneNumber': '9784191282',
    },
    {
      'title': 'Spectrum Storage Solutions Pvt ltd',
      'subtext': 'Jaipur,Rajasthan',
      'image': 'images/warehouse2.jpeg',
      'directionsUrl': 'https://maps.app.goo.gl/DNPLbf69ZTQKJpF4A',
      'phoneNumber': '9784191282',
    },
    {
      'title': 'Threestar Solutions & Services Private Limited',
      'subtext': 'Mumbai,Maharashtra',
      'image': 'images/warehouse1.jpeg',
      'directionsUrl': 'https://maps.app.goo.gl/dQswriacKqWEnsiy8',
      'phoneNumber': '9930353057',
    },
  ];

  ContainerList({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print('Card tapped!');
        },
        child: ListView.builder(
          itemCount: containerData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          containerData[index]['image']!,
                          height: 110,
                          width: 110,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    containerData[index]['title']!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    containerData[index]['subtext']!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            launch(containerData[index]
                                                ['directionsUrl']!);
                                          },
                                          icon: const Icon(Icons.directions,
                                              size: 20))
                                    ],
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}
