// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api.dart';

class Myproducer extends StatefulWidget {
  const Myproducer({super.key});

  @override
  State<Myproducer> createState() => _MyproducerState();
}

class _MyproducerState extends State<Myproducer> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController industryNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/blankwallpaper.JPEG"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(left: 105, top: 5),
                child: const Text(
                  "Register!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email ID",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Create Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: industryNameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: "Name of the Industry",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: addressController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: "Enter Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Sign-up",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: IconButton(
                              color: Colors.black,
                              onPressed: () async {
                                try {
                                  if (!RegExp(r"^[a-zA-Z0-9+_.-]+@gmail\.com$")
                                      .hasMatch(emailController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Enter a valid email address'),
                                      ),
                                    );
                                    return;
                                  }

                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Passwords do not match'),
                                      ),
                                    );
                                    return;
                                  }

                                  if (passwordController.text.length < 8 ||
                                      !RegExp(r'^(?=.*[A-Z])(?=.*[0-9])')
                                          .hasMatch(passwordController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Password must be strong: at least 8 characters with a capital letter and a number'),
                                      ),
                                    );
                                    return;
                                  }

                                  if (phoneNumberController.text.length != 10) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Enter a valid 10-digit phone number'),
                                      ),
                                    );
                                    return;
                                  }
                                  bool signupSuccess = await api.signup(
                                    nameController.text,
                                    int.parse(phoneNumberController.text),
                                    emailController.text,
                                    passwordController.text,
                                    confirmPasswordController.text,
                                    addressController.text,
                                    industry: industryNameController.text,
                                  );

                                  if (signupSuccess) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Successfully signed up! '),
                                      ),
                                    );

                                    Navigator.pushNamed(context, 'login');
                                  } else if (nameController.text.isEmpty ||
                                      phoneNumberController.text.isEmpty ||
                                      passwordController.text.isEmpty ||
                                      confirmPasswordController.text.isEmpty ||
                                      addressController.text.isEmpty ||
                                      industryNameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('All fields are required'),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Signup failed: ${api.errorMessage}'),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'An error occurred during signup: $e'),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
