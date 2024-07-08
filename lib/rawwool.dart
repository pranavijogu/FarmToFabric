// ignore_for_file: unnecessary_import, library_private_types_in_public_api, sized_box_for_whitespace, deprecated_member_use, use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter_application_1/camera.dart';
import 'package:flutter_application_1/api.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, Uint8List, rootBundle;
import 'package:cloudinary_public/cloudinary_public.dart';

final cloudinary = CloudinaryPublic('dspzxkrhd', 'wqz9vjdx', cache: false);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sheep App',
      home: YourScreen(),
    );
  }
}

class YourScreen extends StatefulWidget {
  const YourScreen({super.key});

  @override
  _YourScreenState createState() => _YourScreenState();
}

class _YourScreenState extends State<YourScreen> {
  // ignore: unused_field
  Uint8List? _image;
  var prodisccontroller = TextEditingController();
  var colour1controller = TextEditingController();
  var weight1controller = TextEditingController();
  var pricecontroller = TextEditingController();
  List<List<dynamic>> csvData = [];
  List<String> breeds = [
    "Chokla",
    "Nali",
    "Marwari",
    "Magra",
    "Jaisalmeri",
    "Pugal",
    "Malpura",
    "Sonadi",
    "Patanwadi",
    "Muzaffarnagri",
    "Jalauni",
    "Hissardale",
    "Avivastra",
    "Bharat Merino",
    "Avikalin",
    "Deccani",
    "Bellary",
    "Changthangi",
    "Gurez",
    "Karnah",
    "Poonchi",
    "Bhakarwal",
    "Rampur Bushair",
    "Tibetan",
    "Balangir",
    "Shahabadi",
    "Chottanagpuri",
    "Gaddi(Bhadarwah)",
    "Bonpala",
    "Kashmir Merino"
  ]; // Add your breeds
  List<String> diseases = [
    "None",
    "Sheep Lice",
    "Sheep worms",
    "Flystrike",
    "Acidosis",
    "Annual ryegrass toxicity(ARGT)",
    "Arthritis",
    "Botulism",
    "Cheesy gland(CLA)",
    "Cobalt deficiency",
    "Coccidiosis",
    "Copper deficiency",
    "Copper poisoning",
    "Dermatophilosis",
    "Exposure losses",
    "Foot abscess",
    "Footrot",
    "Grasstetany(hypomagnesaemia)",
    "Large lungworm",
    "Listerosis(circling disease)",
    "Lupinosis",
    "Mastitis",
    "Milk fever(hypocalcaemia)",
    "Nitrate poisoning",
    "Ovine Johnes disease(OJD)",
    "Oxalate poisoning",
    "Perennial ryegrass",
    "Phalaris poisoning",
    "Phalaris staggers",
    "Photosensitisation",
    "Pink eye",
    "Pneumonia",
    "Polioencephalomalacia",
    "Pregnancy toxaemia",
    "Pulpy kidney(enterotoxaemia)",
    "Pyrrolizidine alkaloid poisoning",
    "Scabby mouth",
    "Selenium deficiency(white muscle)",
    "Tapeworm cysts(bladder worm, sheep measles,hydatids)",
    "Tetanus",
    "Vibrosis"
  ];
  List<File> selectedImages = [];
  String? selectedBreed;
  String? selectedDisease;
  String output = '';

  @override
  void initState() {
    super.initState();
    loadCSVData();
  }

  Future<void> loadCSVData() async {
    String data = await rootBundle.loadString('Assets/sheepbreedd.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
    setState(() {
      csvData = csvTable;
    });
  }

  void findOutput() {
    if (selectedBreed != null && selectedDisease != null) {
      for (List<dynamic> row in csvData) {
        if (row[1] == selectedBreed && row[2] == selectedDisease) {
          setState(() {
            output = row[3].toString();
          });
          return;
        }
      }
      setState(() {
        output = 'No matching record found.';
      });
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "SHEEP BREED",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: DropdownButton<String>(
                      value: selectedBreed,
                      hint: const Text('Select Breed'),
                      isDense: true,
                      elevation: 10,
                      iconSize: 24,
                      items: breeds.map((String breed) {
                        return DropdownMenuItem<String>(
                          value: breed,
                          child: Text(breed),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedBreed = value;
                        });
                      },
                    )),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "ANY DISEASE",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: DropdownButton<String>(
                    value: selectedDisease,
                    hint: const Text(
                      'Select Disease',
                      style: TextStyle(color: Colors.black),
                    ),
                    isExpanded: true,
                    items: diseases.map((String disease) {
                      return DropdownMenuItem<String>(
                        value: disease,
                        child: Text(
                          disease,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedDisease = value;
                      });
                    },
                    style: const TextStyle(fontSize: 16),
                    dropdownColor: Colors.grey[200],
                  ),
                ),
                Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.black,
                    child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 239, 232, 232),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(children: [
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.all(10),
                            child: PickImage(
                              onImageSelected: (imageBytes) {
                                setState(() {
                                  _image = imageBytes;
                                });
                              },
                            ),
                          ))
                        ]))),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    findOutput();
                  },
                  child: const Text('Find Output'),
                ),
                const SizedBox(height: 30),
                const Text(
                  "OUTPUT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Output: $output',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                const Text(
                  "PRODUCT DESCRIPTION",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: prodisccontroller,
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: 'Enter text (max 50 characters)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.all(12.0),
                    counterText: '',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "COLOUR OF WOOL",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: colour1controller,
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: 'Enter text (max 50 characters)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.all(12.0),
                    counterText: '',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "WEIGHT IN KGS",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: weight1controller,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: 'Enter text (max 50 characters)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.all(12.0),
                    counterText: '',
                  ),
                ),
                const Text(
                  "PRICE(per kg)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: pricecontroller,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: 'Enter text (max 50 characters)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.all(12.0),
                    counterText: '',
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Back",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var data = {
                          "sheepbreed1": selectedBreed,
                          "disease": selectedDisease,
                          "output": output,
                          "prodisc": prodisccontroller.text,
                          "colour1": colour1controller.text,
                          "weight1": weight1controller.text,
                          "price1": pricecontroller.text,
                          "images": imageUrl,
                        };

                        try {
                          await Api.addwool(data);

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Success"),
                                content: const Text("Wool successfully added"),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } catch (error) {
                          print("Error adding wool: $error");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Failed to add wool. Please try again."),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ));
  }
}
