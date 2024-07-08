// "http://192.168.48.10:3000/api/"; //192.168.116.10 192.168.1.101 ipconfig getifaddr en0

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/marketplace.dart';
//import 'product_model_raw.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/marketplace_raw.dart';
//import 'package:flutter_application_1/product_model.dart';

class Api {
  String errorMessage = '';
  static const baseUrl = "http://172.20.10.2:3000/api/"; //192.168.116.10
// Sign Up API
  Future<bool> signup(String name, int number, String email, String password,
      String confirmpassword, String address,
      {String industry = '', String services = ''}) async {
    try {
      final response = await http.post(
        Uri.parse("${baseUrl}signup"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'number': number,
          'email': email,
          'password': password,
          'confirmpassword': confirmpassword,
          'address': address,
          'industry': industry,
          'services': services,
        }),
      );

      if (response.statusCode == 200) {
        // Successful signup
        return true;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> result = jsonDecode(response.body);
        errorMessage = result['msg'];
        throw Exception(errorMessage);
      } else if (response.statusCode == 500) {
        errorMessage = 'User save failed';
        throw Exception(errorMessage);
      }

      // Handle other status codes if needed
      return false;
    } catch (e) {
      errorMessage = 'Error during signup: $e';
      print(errorMessage);
      return false;
    }
  }

  // Sign In API
  Future<bool> signin(String email, String password) async {
    final Uri url = Uri.parse("${baseUrl}signin");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login
        return true;
      } else if (response.statusCode == 400) {
        // Incorrect credentials
        Map<String, dynamic> result = jsonDecode(response.body);
        throw Exception(result['msg']);
      } else if (response.statusCode == 404) {
        // User not found
        throw Exception('User with this email does not exist');
      } else {
        // Handle other status codes as needed
        throw Exception('Failed to login');
      }
    } catch (e) {
      // Handle network errors
      print("Network error during login: $e");
      // ignore: use_rethrow_when_possible
      throw e; // Rethrow the exception to be caught in the login page
    }
  }

  static addwool(Map wdata) async {
    var url = Uri.parse("${baseUrl}addwool");

    try {
      final res = await http.post(url, body: wdata);
      print("Response status code: ${res.statusCode}");
      print("Response body: ${res.body}");

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get data");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static addprod(Map pdata) async {
    var url = Uri.parse("${baseUrl}addprod");

    try {
      final res = await http.post(url, body: pdata);
      print("Response status code: ${res.statusCode}");
      print("Response body: ${res.body}");

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get data");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<ProductRaw>> getwool() async {
    List<ProductRaw> wool = [];

    var url = Uri.parse("${baseUrl}getwool");

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data['wool'].forEach((value) {
          wool.add(ProductRaw(
              prodisc: value['prodisc'],
              colour1: value['colour1'],
              weight1: value['weight1'],
              price1: value['price1'],
              sheepbreed1: value['sheepbreed1'],
              disease: value['disease'],
              output: value['output'],
              images: value['images']));
        });

        return wool;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  static Future<List<Products>> getprod() async {
    List<Products> products = [];

    var url = Uri.parse("${baseUrl}getprod");

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data['products'].forEach((value) {
          products.add(Products(
              sheep_breed: value['sheep_breed'],
              colour: value['colour'],
              weight: value['weight'],
              price: value['price'],
              description: value['description'],
              images: value['images']));
        });

        return products;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  static delprod(id) async {
    var url = Uri.parse("${baseUrl}del/$id");
    final res = await http.post(url);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed to delete");
    }
  }
}
