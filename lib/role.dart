import 'package:flutter/material.dart';
//import 'package:flutter_application_1/option.dart';
import 'package:flutter_application_1/roundedbutton.dart';

class Myrole extends StatefulWidget {
  const Myrole({super.key});

  @override
  State<Myrole> createState() => _MyroleState();
}

class _MyroleState extends State<Myrole> {
  String selectedRole = '';

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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "CHOOSE YOUR ROLE",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RadioListTile(
                    title: const Text(
                      'FARMER',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 'FARMER',
                    groupValue: selectedRole,
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'PRODUCER',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 'PRODUCER',
                    groupValue: selectedRole,
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'SERVICES STORE',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 'SERVICES STORE',
                    groupValue: selectedRole,
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'GENERAL',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 'GENERAL',
                    groupValue: selectedRole,
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value.toString();
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  RoundedButton(
                    text: "Continue",
                    color: Colors.green,
                    onPressed: () {
                      if (selectedRole == 'FARMER') {
                        Navigator.pushReplacementNamed(context, "farmer");
                      } else if (selectedRole == 'PRODUCER') {
                        Navigator.pushReplacementNamed(context, "producer");
                      } else if (selectedRole == 'SERVICES STORE') {
                        Navigator.pushReplacementNamed(context, "servicesreg");
                      } else if (selectedRole == 'GENERAL') {
                        Navigator.pushReplacementNamed(context, "register");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
