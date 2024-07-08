// import 'package:flutter/material.dart';

// class OrdersPage extends StatefulWidget {
//   final List<String> cartItems;

//   OrdersPage({required this.cartItems});

//   @override
//   _OrdersPageState createState() => _OrdersPageState();
// }

// class _OrdersPageState extends State<OrdersPage> {
//   int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 34, 183, 61),
//         foregroundColor: Colors.white,
//         title: Row(
//           children: [
//             FlutterLogo(), // Replace with your logo image path
//             SizedBox(width: 12.0),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   color: Colors.white,
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search...',
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.all(8.0),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Handle search button press
//               // You can implement search functionality here
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color.fromARGB(255, 67, 188, 84),
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           // Handle bottom navigation bar item tap
//           setState(() {
//             _currentIndex = index;
//           });

//           // You can add your navigation logic here based on the index
//           switch (index) {
//             case 0:
//               Navigator.pushNamed(context, "homepage");
//               break;
//             case 1:
//               Navigator.pushNamed(context, "cartscreen");
//               break;
//             case 2:
//               Navigator.pushNamed(context, "profile");
//               break;
//             case 3:
//               Navigator.pushNamed(context, "settings");
//               break;
//           }
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home_max_outlined,
//               color: Colors.black,
//             ),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.shopping_cart,
//               color: Colors.black,
//             ),
//             label: "Cart",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: Colors.black,
//             ),
//             label: "Profile",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.settings,
//               color: Colors.black,
//             ),
//             label: "Settings",
//           )
//         ],
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//       ),
//       body: widget.cartItems.isEmpty
//           ? Center(
//               child: Text('No items in your cart.'),
//             )
//           : ListView.builder(
//               itemCount: widget.cartItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(widget.cartItems[index]),
//                 );
//               },
//             ),
//     );
//   }
// }
