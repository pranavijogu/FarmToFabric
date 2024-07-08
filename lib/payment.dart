// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/shop.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedAddress = '';
  String selectedPaymentMode = '';
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

  @override
  Widget build(BuildContext context) {
    final shop = context.watch<Shop>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 183, 61),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Address:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              RadioListTile(
                title: const Text(
                  'Address 1',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  userData['address'] ??
                      '', // Use user's address from the fetched data
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                value: 'Address 1',
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value as String;
                  });
                },
              ),
              // RadioListTile(
              //   title: Text(
              //     'Address 2',
              //     style: TextStyle(fontSize: 18),
              //   ),
              //   subtitle: Text(
              //     '456 Park Ave, Townsville, Country',
              //     style: TextStyle(fontSize: 14, color: Colors.grey),
              //   ),
              //   value: 'Address 2',
              //   groupValue: selectedAddress,
              //   onChanged: (value) {
              //     setState(() {
              //       selectedAddress = value as String;
              //     });
              //   },
              // ),
              // RadioListTile(
              //   title: Text(
              //     'Address 3',
              //     style: TextStyle(fontSize: 18),
              //   ),
              //   subtitle: Text(
              //     '789 Center St, Villageland, Country',
              //     style: TextStyle(fontSize: 14, color: Colors.grey),
              //   ),
              //   value: 'Address 3',
              //   groupValue: selectedAddress,
              //   onChanged: (value) {
              //     setState(() {
              //       selectedAddress = value as String;
              //     });
              //   },
              // ),
              const SizedBox(height: 16),
              const Text(
                'Select Payment Mode:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              RadioListTile(
                title: const Text(
                  'Credit Card',
                  style: TextStyle(fontSize: 18),
                ),
                value: 'Credit Card',
                groupValue: selectedPaymentMode,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMode = value as String;
                  });
                },
              ),
              RadioListTile(
                title: const Text(
                  'UPI',
                  style: TextStyle(fontSize: 18),
                ),
                value: 'UPI',
                groupValue: selectedPaymentMode,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMode = value as String;
                  });
                },
              ),
              RadioListTile(
                title: const Text(
                  'Cash on delivery',
                  style: TextStyle(fontSize: 18),
                ),
                value: 'Cash on delivery',
                groupValue: selectedPaymentMode,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMode = value as String;
                  });
                },
              ),
              RadioListTile(
                title: const Text(
                  'Net banking',
                  style: TextStyle(fontSize: 18),
                ),
                value: 'Net banking',
                groupValue: selectedPaymentMode,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMode = value as String;
                  });
                },
              ),
              const SizedBox(height: 16),
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
                      text: "Pay Now",
                      onTap: () {
                        if (selectedAddress.isEmpty &&
                            selectedPaymentMode.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please select an address and payment mode.'),
                            ),
                          );
                        } else if (selectedAddress.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select an address.'),
                            ),
                          );
                        } else if (selectedPaymentMode.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a payment mode.'),
                            ),
                          );
                        } else {
                          Navigator.pushNamed(context, "placedorder");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
