import 'package:flutter/material.dart';

class YourCategories1 extends StatefulWidget {
  const YourCategories1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _YourCategories1State createState() => _YourCategories1State();
}

class _YourCategories1State extends State<YourCategories1> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "marketplace_raw");
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "RAW WOOL",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Image.asset('images/rawwool.jpeg',
                            width: 100, height: 100),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "marketplace");
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "WOOL FABRIC",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Image.asset('images/woolfabric.jpeg',
                            width: 100, height: 100),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
