// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/productbase.dart';
//import 'package:flutter_application_1/marketplace.dart';
//import 'package:flutter_application_1/productslider.dart';
import 'package:flutter_application_1/shop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Myproductdiscraw extends StatefulWidget {
  const Myproductdiscraw({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyproductdiscrawState createState() => _MyproductdiscrawState();
}

class _MyproductdiscrawState extends State<Myproductdiscraw> {
  int quantityCount = 0;
  late Map<String, dynamic> productDetails1;

  void decerementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addtoCart() {
    if (quantityCount > 0) {
      final Shop shopProvider = context.read<Shop>();

      shopProvider.addtoCart(
        ProductRaw(
            sheepbreed1: productDetails1['sheepbreed1'],
            price1: productDetails1['price1'],
            weight1: productDetails1['weight1'],
            colour1: productDetails1['colour1'],
            prodisc: productDetails1['prodisc'],
            disease: productDetails1['disease'],
            images: productDetails1['images'],
            output: productDetails1['output']) as ProductBase,
        quantityCount,
      );

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text(
            "Successfully Added To Cart!",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    productDetails1 =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

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
      bottomNavigationBar: Container(
        height: 160,
        color: const Color.fromARGB(255, 230, 230, 230),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  '₹' + productDetails1['price1'].toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 210, 210, 210),
                          shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(Icons.remove),
                        color: Colors.black,
                        onPressed: decerementQuantity,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      quantityCount.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 210, 210, 210),
                          shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        color: Colors.black,
                        onPressed: incrementQuantity,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Mybutton(
              text: "Add To Cart",
              onTap: addtoCart,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          productDetails1['images'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetails1['sheepbreed1'],
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Product Description:",
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            height: 1.65,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        productDetails1['prodisc'],
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.65),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Colour:",
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            height: 1.65,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        productDetails1['colour1'],
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.65),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Weight:",
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            height: 1.65,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        productDetails1['weight1'].toString(),
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.65),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Disease:",
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            height: 1.65,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        productDetails1['disease'].toString(),
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.65),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Output:",
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            height: 1.65,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        productDetails1['output'].toString(),
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.65),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
