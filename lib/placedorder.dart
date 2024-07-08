// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/shop.dart';
import 'package:provider/provider.dart';

class Myplacedorder extends StatefulWidget {
  const Myplacedorder({super.key});

  @override
  State<Myplacedorder> createState() => _MyplacedorderState();
}

class _MyplacedorderState extends State<Myplacedorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Order Placed Successfully!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Thank you for shopping with us.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              Mybutton(
                text: 'Continue Shopping',
                onTap: () {
                  context.read<Shop>().clearCart();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'homepage',
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
