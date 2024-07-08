import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Myproductslider extends StatefulWidget {
  const Myproductslider({super.key});

  @override
  State<Myproductslider> createState() => _MyproductsliderState();
}

class _MyproductsliderState extends State<Myproductslider> {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: Colors.redAccent,
      indicatorBackgroundColor: Colors.white,
      height: 350,
      autoPlayInterval: 1500,
      indicatorRadius: 4,
      isLoop: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/images-3.jpeg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/images-3.jpeg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/images-3.jpeg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/images-3.jpeg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/images-3.jpeg"),
        ),
      ],
    );
  }
}
