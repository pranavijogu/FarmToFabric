// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Myeducation extends StatefulWidget {
  const Myeducation({super.key});

  @override
  State<Myeducation> createState() => _MyeducationState();
}

class _MyeducationState extends State<Myeducation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 67, 188, 84),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            switch (index) {
              case 0:
                Navigator.pushNamed(context, "homepage");

                break;
              case 1:
                Navigator.pushNamed(context, "cartscreen");
                break;
              case 2:
                Navigator.pushNamed(context, "profile");
                break;
              case 3:
                Navigator.pushNamed(context, "settings");
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_max_outlined,
                color: Colors.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: "Settings",
            )
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Indian Wool Industry",
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 26,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The wool industry has been undergoing significant transformation over the years, as technological advancements in knitting and improvement in textures and fabric quality continue to speak of a new wave of aesthetic appreciation. The real growth opportunities, however, lie with millennial consumers whose purchasing behavior such as preference for quality, authenticity, and transparency are characteristics inherent to wool.",
                      style: GoogleFonts.nunito(fontSize: 18, height: 1.60),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            const url =
                                'https://www.texmin.nic.in/sector-industry/wool';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: const Text(
                            "To know more",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Forthcoming International Events/Trade Shows",
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 26,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageSlideshow(
                          width: double.infinity,
                          height: 300,
                          initialPage: 0,
                          indicatorColor: Colors.redAccent,
                          indicatorBackgroundColor: Colors.white,
                          autoPlayInterval: 5000,
                          indicatorRadius: 4,
                          isLoop: true,
                          children: [
                            Image.asset("images/3.jpg", fit: BoxFit.contain),
                            Image.asset("images/4.jpg", fit: BoxFit.contain),
                            Image.asset("images/2.jpg", fit: BoxFit.contain),
                            Image.asset("images/3-2.jpg", fit: BoxFit.contain),
                            Image.asset("images/All-Fair-Brochure.png",
                                fit: BoxFit.contain),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            const url =
                                'http://wwepcindia.com/upcoming-exhibitions/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: const Text(
                            "Click here to register",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text("Wool In India",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 26,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "In India,the weaving and bleaching of wool is attributed to 'God Pasham' who was God of shepherds and wool is used as a rug for prayers and traditional Wool 'Asan' is still used for Puja.India has been famous for shawls and carpets which were exported in large numbers to European countries during the medieval period. These were greatly appreciated and highly prized for their fine texture and excellent workmanship.",
                            style:
                                GoogleFonts.nunito(fontSize: 18, height: 1.60),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            const url =
                                'https://woolboard.nic.in/wool_in_india.htm';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: const Text(
                            "To know more",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("India's Wool production and export trends",
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 26,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageSlideshow(
                          width: double.infinity,
                          height: 300,
                          initialPage: 0,
                          indicatorColor: Colors.redAccent,
                          indicatorBackgroundColor: Colors.white,
                          autoPlayInterval: 5000,
                          indicatorRadius: 4,
                          isLoop: true,
                          children: [
                            Image.asset("images/wool-new-1.jpg",
                                fit: BoxFit.contain),
                            Image.asset("images/wool-new-2.jpg",
                                fit: BoxFit.contain),
                            Image.asset("images/wool-new-3.jpg",
                                fit: BoxFit.contain),
                            Image.asset("images/Wool-and-Woolen-3-new.jpg",
                                fit: BoxFit.contain),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            const url =
                                'https://www.ibef.org/exports/wool-industry-india';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: const Text(
                            "To know more",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text("Integrated Wool Development Programme",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 26,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Integrated Wool Development Programme (IWDP) is an umbrella programme, implemented in all wool-producing states to support small, medium and large scale wool-producing units. The scheme was also implemented to boost the economic status of the wool-producing manufacturers in the rural regions of the country.The primary goal of the scheme is to stop the decline of the wool production in India and uplift the manufacturing process by offering various components in this scheme and to enable a steady growth in the production of wool among all rural wool-producing sectors.",
                            style:
                                GoogleFonts.nunito(fontSize: 18, height: 1.60),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            const url =
                                'https://www.indiafilings.com/learn/integrated-wool-development-programme/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: const Text(
                            "To know more",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ])),
        ),
      ),
    );
  }
}
