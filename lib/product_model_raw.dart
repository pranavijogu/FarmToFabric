// ignore_for_file: non_constant_identifier_names

abstract class ProductBase {}

class ProductRaw implements ProductBase {
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

class Products implements ProductBase {
  String sheep_breed;
  int price;
  String weight;
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
