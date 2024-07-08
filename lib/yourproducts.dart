// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/api.dart';
// import 'package:flutter_application_1/marketplace.dart';
// //import 'package:wool_to_fabric/product_model.dart';

// class MyProdDisplay extends StatefulWidget {
//   const MyProdDisplay({Key? key}) : super(key: key);

//   @override
//   State<MyProdDisplay> createState() => _MyProdDisplayState();
// }

// class _MyProdDisplayState extends State<MyProdDisplay> {
//   late Future<List<Products>> products;

//   @override
//   void initState() {
//     super.initState();
//     products = Api.getprod();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 34, 183, 61),
//         title: Row(
//           children: [
//             FlutterLogo(),
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
//       body: FutureBuilder<List<Products>>(
//         future: products,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             List<Products> productData = snapshot.data!;
//             return ListView.builder(
//               itemCount: productData.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: EdgeInsets.all(8.0),
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Default Wool Type',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.0,
//                         ),
//                         Container(
//                           height: 150,
//                           width: double.infinity,
//                           // Placeholder for image widget, you can add your image widget here
//                           color: Colors.grey,
//                         ),
//                         SizedBox(height: 30.0),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.star,
//                               color: Colors.yellow[800],
//                             ),
//                             SizedBox(width: 5),
//                             Text("4"),
//                           ],
//                         ),
//                         SizedBox(height: 10.0),
//                         Text(
//                           'Price: ${productData[index].price ?? 'N/A'}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 5.0),
//                         Text(
//                           'Description: ${productData[index].description ?? 'No Description'}',
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         SizedBox(height: 5.0),
//                         Text(
//                           'Sheep Breed: ${productData[index].sheep_breed ?? 'Unknown'}',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           'Colour: ${productData[index].colour ?? 'Unknown'}',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           'Weight: ${productData[index].weight ?? 'Unknown'}',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           'Services done: ${productData[index].weight ?? 'Unknown'}',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           'Fibre Characteristics: strong',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('No data available.'));
//           }
//         },
//       ),
//     );
//   }
// }
