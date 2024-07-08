import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/shop.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/productbase.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  void removeFromCart(ProductBase products, BuildContext context) {
    final shopProvider = context.read<Shop>();
    shopProvider.removefromCart(products);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 34, 183, 61),
          foregroundColor: Colors.white,
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: shop.cart.length,
              itemBuilder: (context, index) {
                final ProductBase prod = shop.cart[index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 220, 220, 220),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListTile(
                    title: Text(
                      (prod is ProductRaw)
                          ? prod.sheepbreed1!
                          : (prod is Products)
                              ? prod.sheep_breed
                              : 'Unknown Breed',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    subtitle: Text(
                      (prod is ProductRaw)
                          ? '${prod.price1}'
                          : (prod is Products)
                              ? '${prod.price}'
                              : 'Unknown Price',
                      style: const TextStyle(fontSize: 15),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeFromCart(prod, context),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Text(
                  'Total Bill: ₹${shop.calculateTotalBill()}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Mybutton(
                  text: "Proceed",
                  onTap: () {
                    if (shop.calculateTotalBill() == 0) {
                      // Show Snackbar when the total bill is 0
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                          content: const Text(
                            "There are no items in your cart! Add items to proceed.",
                            style: TextStyle(color: Colors.black),
                          ),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.done))
                          ],
                        ),
                      );
                    } else {
                      // Navigate to the payment page when the total bill is not 0
                      Navigator.pushNamed(context, "payment");
                    }
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
