// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_application_1/in_app_tour_target.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_application_1/article_model.dart';
//import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  int _currentIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final MarketKey = GlobalKey();
  final QualityKey = GlobalKey();
  final WarehouseKey = GlobalKey();
  final ServicesKey = GlobalKey();
  final EducationKey = GlobalKey();
  final TrackingKey = GlobalKey();
  final NewsKey = GlobalKey();
  final PriceKey = GlobalKey();

  //late TutorialCoachMark tutorialCoachMark;

  /*void _initHomePageInAppTour() {
    tutorialCoachMark = TutorialCoachMark(
      targets: addSiteTargets(
        MarketKey: MarketKey,
        QualityKey: QualityKey,
        WarehouseKey: WarehouseKey,
        ServicesKey: ServicesKey,
        EducationKey: EducationKey,
        TrackingKey: TrackingKey,
        NewsKey: NewsKey,
        PriceKey: PriceKey,
      ),
      colorShadow: Colors.green,
      paddingFocus: 10,
      hideSkip: false,
      opacityShadow: 0.8,
      onFinish: () {
        print("completed");
      },
    );
  }

  void _showInAppTour() {
    Future.delayed(const Duration(milliseconds: 6), () {
      tutorialCoachMark.show(context: context);
    });
  }

  @override
  void initState() {
    super.initState();
    _initHomePageInAppTour();
    _showInAppTour();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          padding: const EdgeInsets.only(top: 20.0),
          child: SafeArea(
            child: Column(
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
                  //isLoop: true,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "images/homepagemap.jpeg",
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          bottom: 20,
                          child: GestureDetector(
                            onTap: () {
                              _launchURL('https://woolboard.nic.in/');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.black.withOpacity(0.5),
                              child: RichText(
                                text: TextSpan(
                                  text: 'visit the site',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _launchURL('https://woolboard.nic.in/');
                                    },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                      //Image.asset("images/wool-new-2.jpg", fit: BoxFit.contain),
                      //Image.asset("images/wool-new-3.jpg", fit: BoxFit.contain),
                      //Image.asset("images/Wool-and-Woolen-3-new.jpg",
                      //fit: BoxFit.contain),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "categories1");
                            },
                            child: Card(
                              key: MarketKey,
                              elevation: 10,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 100,
                                height: 100,
                                child: const ClipOval(
                                    child: Image(
                                  image: AssetImage("images/woolmarket.jpg"),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                            child: Text(
                              "Buy wool",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "warehouses");
                            },
                            child: Card(
                              key: WarehouseKey,
                              elevation: 10,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 100,
                                height: 100,
                                child: const ClipOval(
                                    child: Image(
                                  image: AssetImage("images/warehouses.jpg"),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                            child: Text(
                              "Warehouses",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "wooleducation");
                            },
                            child: Card(
                              key: EducationKey,
                              elevation: 10,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 100,
                                height: 100,
                                child: const ClipOval(
                                    child: Image(
                                  image:
                                      AssetImage("images/wooleducation.jpeg"),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                            child: Text(
                              "Wool Education",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // Handle button tap
                                Navigator.pushNamed(context, "categories");
                              },
                              child: Card(
                                key: QualityKey,
                                elevation: 10,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: const ClipOval(
                                      child: Image(
                                    image: AssetImage(
                                        "images/qualityassurance.jpg"),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                              child: Text(
                                "Sell wool",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "services");
                              },
                              child: Card(
                                key: ServicesKey,
                                elevation: 10,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: const ClipOval(
                                      child: Image(
                                    image:
                                        AssetImage("images/woolservices.jpg"),
                                    //fit: BoxFit.cover,
                                  )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                              child: Text(
                                "Wool services",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "tracking");
                              },
                              child: Card(
                                key: TrackingKey,
                                elevation: 10,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: const ClipOval(
                                      child: Image(
                                    image: AssetImage("images/tracking.jpg"),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                              child: Text(
                                "Tracking",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 450,
                            width: 110,
                            child: const ContainerList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  try {
    // ignore: deprecated_member_use
    await launch(url);
  } catch (e) {
    // ignore: avoid_print
    print('Error launching URL: $e');
  }
}

class ContainerList extends StatefulWidget {
  const ContainerList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContainerListState createState() => _ContainerListState();
}

class _ContainerListState extends State<ContainerList> {
  List<ArticleModel> _containerData = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final jsondata = await rootBundle.loadString('jsonfile/data.json');
    final List<dynamic> list = json.decode(jsondata);

    final dataList =
        list.map((article) => ArticleModel.fromJson(article)).toList();

    setState(() {
      _containerData = dataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: _containerData.isNotEmpty
          ? ListView.builder(
              itemCount: _containerData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _containerData[index].title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      _containerData[index].subtext,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    Image(
                      image: NetworkImage(_containerData[index].imageUrl),
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL(_containerData[index].url);
                      },
                      child: const Text(
                        'Know More',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
