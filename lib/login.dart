// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
//import 'package:flutter_application_1/profile.dart';
import 'api.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  TextEditingController loginIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //List<UserData> userList = [];

  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/sheepwallpaper.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 105, top: 100),
              child: const Text(
                "Welcome!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  //top: MediaQuery.of(context).size.height * 0.5,
                  top: 200,
                  left: 35,
                  right: 35),
              child: Column(children: [
                TextField(
                  controller: loginIdController,
                  decoration: InputDecoration(
                      //fillColor: Colors.grey.shade100,
                      //filled: true,
                      hintText: "Login ID",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(

                      //fillColor: Colors.grey.shade100,
                      //filled: true,
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () async {
                          if (loginIdController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please enter login ID and password'),
                              ),
                            );
                          } else {
                            try {
                              bool loginSuccess = await api.signin(
                                loginIdController.text,
                                passwordController.text,
                              );

                              if (loginSuccess) {
                                // Successful login, navigate to Myprofile and suclogin

                                Navigator.pushNamed(context, 'suclogin');
                              } else {
                                // Unsuccessful login, display SnackBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Incorrect username or password'),
                                  ),
                                );
                              }
                            } catch (e) {
                              // Handle other exceptions
                              if (e.toString().contains(
                                  'User with this email does not exist')) {
                                // User not found, display SnackBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'User with this email does not exist'),
                                  ),
                                );
                              } else {
                                // Other exceptions, display a generic error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('An error occurred: $e'),
                                  ),
                                );
                              }
                            }
                          }
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "role");
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "forgotpass");
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              color: Colors.black),
                        ))
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
