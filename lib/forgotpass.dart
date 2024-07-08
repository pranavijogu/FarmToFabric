import 'package:flutter/material.dart';

class Myforgotpass extends StatefulWidget {
  const Myforgotpass({super.key});

  @override
  State<Myforgotpass> createState() => _MyforgotpassState();
}

class _MyforgotpassState extends State<Myforgotpass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/sheepwallpaper.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 66, top: 30),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 115, left: 35, right: 35),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const Text(
                      "Continue",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pushNamed(context, "createnewpass");
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    )
                  ])
                ]),
              )
            ],
          )),
    );
  }
}
