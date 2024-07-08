// ignore_for_file: deprecated_member_use, use_build_context_synchronously, avoid_print, library_private_types_in_public_api, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter/foundation.dart';

import 'camera.dart';

import 'package:cloudinary_public/cloudinary_public.dart';

final cloudinary = CloudinaryPublic('dspzxkrhd', 'wqz9vjdx', cache: false);

class MyProdDescriptionF extends StatefulWidget {
  const MyProdDescriptionF({Key? key}) : super(key: key);

  @override
  State<MyProdDescriptionF> createState() => _MyProdDescriptionState();
}

class _MyProdDescriptionState extends State<MyProdDescriptionF> {
  // ignore: unused_field
  Uint8List? _image;
  var sheepbreedcontroller = TextEditingController();
  var colourcontroller = TextEditingController();
  var weightcontroller = TextEditingController();
  var fibrecontroller = TextEditingController();
  var pricecontroller = TextEditingController();
  var desccontroller = TextEditingController();
  TextEditingController servicesController = TextEditingController();
  TextEditingController woolTypeController = TextEditingController();

  List<bool> checkboxControllers = List.generate(9, (index) => false);
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
          children: [
            const SizedBox(height: 10),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.black,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 232, 232),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 20),
            const Text(
              "SELLER TYPE",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: DropdownExample(),
            ),
            const SizedBox(height: 15),
            const Text(
              "WOOL TYPE",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownExample2(woolTypeController: woolTypeController),
            const SizedBox(height: 20),
            const Text(
              "SHEEP BREED",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: sheepbreedcontroller,
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
              controller: colourcontroller,
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
              controller: weightcontroller,
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
            const SizedBox(height: 30),
            const Text(
              "FIBRE CHARACTERISTICS",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: fibrecontroller,
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
            const SizedBox(height: 30),
            const Text(
              "PRICE",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: pricecontroller,
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
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Services done(if any) (optional)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          servicesController.text = selectedServices.join(", ");
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
                      "*if you have done any other services not mentioned here,please type in the field",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Product Description(brief)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: desccontroller,
              maxLength: 150,
              decoration: InputDecoration(
                hintText: 'Enter text (max 150 characters)',
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
                  onPressed: () {
                    // Handle button press
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
                      "Back",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var data = {
                      "sheep_breed": sheepbreedcontroller.text,
                      "colour": colourcontroller.text,
                      "weight": weightcontroller.text,
                      "fibre": fibrecontroller.text,
                      "price": pricecontroller.text,
                      "description": desccontroller.text,
                      "services": servicesController.text,
                      "wooltype": woolTypeController.text,
                      "images": imageUrl,
                    };

                    try {
                      await Api.addprod(data);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Success"),
                            content: const Text("Product successfully added"),
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
                      print("Error adding product: $error");

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Failed to add product. Please try again."),
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
            )
          ],
        ),
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? valueChoose;
  List listitem = ["FARMER", "PRODUCER"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton(
              hint: const Text("Select the seller category:"),
              dropdownColor: Colors.grey,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.black, fontSize: 18),
              value: valueChoose,
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue as String?;
                });
              },
              items: listitem.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownExample2 extends StatefulWidget {
  final TextEditingController woolTypeController;

  const DropdownExample2({super.key, required this.woolTypeController});

  @override
  _DropdownExampleState2 createState() => _DropdownExampleState2();
}

class _DropdownExampleState2 extends State<DropdownExample2> {
  String? valueChoose;
  List<String> listitem1 = [
    "MERINO",
    "CASHMERE",
    "ANGORA",
    "LAMBSWOOL",
    "SHETLAND",
    "TIBETAN",
    "PASHMINA"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton(
              hint: const Text("Select the wool type:"),
              dropdownColor: Colors.grey,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.black, fontSize: 18),
              value: valueChoose,
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue as String?;
                  widget.woolTypeController.text = valueChoose ?? '';
                });
              },
              items: listitem1.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              }).toList(),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: widget.woolTypeController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Selected wool type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.all(12.0),
              ),
            ),
          ),
        ],
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
