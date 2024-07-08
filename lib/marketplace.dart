// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, avoid_print, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products {
  String sheep_breed;
  int price;
  String weight; // Change the data type to int
  String colour;
  String description;
  String images;

  Products(
      {required this.sheep_breed,
      required this.price,
      required this.weight,
      required this.colour,
      required this.description,
      required this.images});
}

class Mymarketplace extends StatefulWidget {
  const Mymarketplace({super.key});

  @override
  State<Mymarketplace> createState() => _MymarketplaceState();
}

class _MymarketplaceState extends State<Mymarketplace> {
  int _currentIndex = 0;
  List<Products> _details = [];

  @override
  void initState() {
    super.initState();
    _fetchDataFromAPI();
  }

  Future<void> _fetchDataFromAPI() async {
    try {
      List<Products> products = await fetchProductsFromAPI();
      if (mounted) {
        setState(() {
          _details = products;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<List<Products>> fetchProductsFromAPI() async {
    final apiUrl = Uri.parse("http://172.20.10.2:3000/api/getprod");

    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        return jsonData
            .map((data) => Products(
                sheep_breed: data['sheep_breed'],
                price: data['price'],
                weight: data['weight'],
                colour: data['colour'],
                description: data['description'],
                images: data['images']))
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
                  "productdisc",
                  arguments: {
                    'sheep_breed': _details[index].sheep_breed,
                    'price': _details[index].price,
                    'images': _details[index].images,
                    'weight': _details[index].weight,
                    'colour': _details[index].colour,
                    'description': _details[index].description,
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
                              _details[index].sheep_breed,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "₹${_details[index].price}",
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
