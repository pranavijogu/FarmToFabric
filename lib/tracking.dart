import 'package:flutter/material.dart';

class Mytracking extends StatefulWidget {
  const Mytracking({super.key});

  @override
  State<Mytracking> createState() => _MytrackingState();
}

class _MytrackingState extends State<Mytracking> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/trackingbg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.white,
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
                Expanded(
                  child: ListView(
                    children: const [
                      ListTile(
                          leading: CircleAvatar(
                            child: Text('1'),
                          ),
                          title: Text('Order Placed'),
                          subtitle: Text('2024/01/20 15:35 PM')),
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('2'),
                        ),
                        title: Text('Dispatch Progress'),
                        subtitle: Text('2024/01/22 11:30 AM'),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('3'),
                        ),
                        title: Text('In Transit'),
                        subtitle: Text('2024/01/23 04:20 AM'),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('4'),
                        ),
                        title: Text('Parcel Arrived at \ndelivery hub'),
                        subtitle: Text('2024/01/22 08:00 PM'),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('5'),
                        ),
                        title: Text('Out For Delivery'),
                        subtitle: Text('2024/01/23 10:30 AM'),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('6'),
                        ),
                        title: Text('Ready For Pickup'),
                        subtitle: Text('2024/01/24 10:00 AM'),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
