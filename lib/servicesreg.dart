// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'api.dart';

class Myservicesreg extends StatefulWidget {
  const Myservicesreg({super.key});

  @override
  State<Myservicesreg> createState() => _MyservicesregState();
}

class _MyservicesregState extends State<Myservicesreg> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController servicesController = TextEditingController();

  Api api = Api();

  List<bool> checkboxControllers = List.generate(9, (index) => false);
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
                  child: Column(children: [
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
                      controller: addressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Enter Your Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Services offered by your store",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            DropBox(
                              checkboxControllers: checkboxControllers,
                              onServicesChanged: (selectedServices) {
                                setState(() {
                                  servicesController.text =
                                      selectedServices.join(", ");
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: servicesController,
                              decoration: InputDecoration(
                                hintText: 'Selected services',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: const EdgeInsets.all(12.0),
                              ),
                            ),
                            const Text(
                                "*If you have any other services not mentioned here,please type in the field",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500))
                          ],
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
                                    if (!RegExp(
                                            r"^[a-zA-Z0-9+_.-]+@gmail\.com$")
                                        .hasMatch(emailController.text)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Enter a valid email address'),
                                        ),
                                      );
                                      return;
                                    }

                                    if (passwordController.text !=
                                        confirmPasswordController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Passwords do not match'),
                                        ),
                                      );
                                      return;
                                    }

                                    if (passwordController.text.length < 8 ||
                                        !RegExp(r'^(?=.*[A-Z])(?=.*[0-9])')
                                            .hasMatch(
                                                passwordController.text)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Password must be strong: at least 8 characters with a capital letter and a number'),
                                        ),
                                      );
                                      return;
                                    }

                                    if (phoneNumberController.text.length !=
                                        10) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Enter a valid 10-digit phone number'),
                                        ),
                                      );
                                      return;
                                    }
                                    bool signupSuccess = await Api().signup(
                                      nameController.text,
                                      int.parse(phoneNumberController.text),
                                      emailController.text,
                                      passwordController.text,
                                      confirmPasswordController.text,
                                      addressController.text,
                                      services: servicesController.text,
                                    );

                                    if (signupSuccess) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Successfully signed up! '),
                                        ),
                                      );
                                      Navigator.pushNamed(context, 'login');
                                    } else if (nameController.text.isEmpty ||
                                        phoneNumberController.text.isEmpty ||
                                        passwordController.text.isEmpty ||
                                        confirmPasswordController
                                            .text.isEmpty ||
                                        addressController.text.isEmpty ||
                                        servicesController.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('All fields are required'),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DropBox extends StatefulWidget {
  final List<bool> checkboxControllers;
  final Function(List<String>) onServicesChanged;

  const DropBox({
    super.key,
    required this.checkboxControllers,
    required this.onServicesChanged,
  });

  @override
  _DropBoxState createState() => _DropBoxState();
}

class _DropBoxState extends State<DropBox> {
  List<Map<String, dynamic>> categories = [
    {"name": "Shearing", "isChecked": false},
    {"name": "Washing", "isChecked": false},
    {"name": "Dyeing", "isChecked": false},
    {"name": "Spinning", "isChecked": false},
    {"name": "Knitting", "isChecked": false},
    {"name": "Weaving", "isChecked": false},
    {"name": "Felting", "isChecked": false},
    {"name": "Carding", "isChecked": false},
    {"name": "Combing", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(categories.length, (index) {
        return CheckboxListTile(
          title: Text(categories[index]["name"]),
          value: widget.checkboxControllers[index],
          onChanged: (value) {
            setState(() {
              widget.checkboxControllers[index] = value ?? false;
              widget.onServicesChanged(getSelectedServices());
            });
          },
        );
      }),
    );
  }

  List<String> getSelectedServices() {
    List<String> selectedServices = [];
    for (int i = 0; i < categories.length; i++) {
      if (widget.checkboxControllers[i]) {
        selectedServices.add(categories[i]["name"]);
      }
    }
    return selectedServices;
  }
}
