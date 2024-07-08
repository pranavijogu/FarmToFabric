// ignore_for_file: avoid_print, avoid_unnecessary_containers

import 'dart:convert';
//import 'dart:io';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ProductRaw {
  final String? prodisc;
  final String? colour1;
  final int? weight1;
  final int? price1;
  final String? sheepbreed1;
  final String? disease;
  final String? output;
  final String images;

  ProductRaw(
      {this.prodisc,
      this.colour1,
      this.weight1,
      this.price1,
      this.sheepbreed1,
      this.disease,
      this.output,
      required this.images});
}

class Mymarketplaceraw extends StatefulWidget {
  const Mymarketplaceraw({super.key});

  @override
  State<Mymarketplaceraw> createState() => _MymarketplacerawState();
}

class _MymarketplacerawState extends State<Mymarketplaceraw> {
  int _currentIndex = 0;
  List<ProductRaw> _details = [];

  @override
  void initState() {
    super.initState();
    _fetchDataFromAPI();
  }

  Future<void> _fetchDataFromAPI() async {
    try {
      List<ProductRaw> wool = await fetchProductsFromAPI();
      if (mounted) {
        setState(() {
          _details = wool;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<List<ProductRaw>> fetchProductsFromAPI() async {
    final apiUrl = Uri.parse("http://172.20.10.2:3000/api/getwool");

    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        return jsonData
            .map((data1) => ProductRaw(
                sheepbreed1: data1['sheepbreed1'],
                price1: data1['price1'],
                weight1: data1['weight1'],
                colour1: data1['colour1'],
                prodisc: data1['prodisc'],
                disease: data1['disease'],
                output: data1['output'],
                images: data1['images']))
            .toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

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
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (1 / 1.4),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: _details.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "productdiscraw",
                  arguments: {
                    'sheepbreed1': _details[index].sheepbreed1,
                    'price1': _details[index].price1,
                    //'imageUrl': _details[index].imageUrl,
                    'weight1': _details[index].weight1,
                    'colour1': _details[index].colour1,
                    'prodisc': _details[index].prodisc,
                    'images': _details[index].images,
                    'disease': _details[index].disease,
                    'output': _details[index].output,
                  },
                );
              },
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: _details[index].images.isNotEmpty
                              ? Image.network(
                                  _details[index].images,
                                  fit: BoxFit.cover,
                                )
                              : const Placeholder(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _details[index].sheepbreed1 ?? 'Unknown Breed',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "₹${_details[index].price1}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
