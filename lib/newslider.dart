import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Mynewslider extends StatefulWidget {
  const Mynewslider({super.key});

  @override
  State<Mynewslider> createState() => _MynewsliderState();
}

class _MynewsliderState extends State<Mynewslider> {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: Colors.redAccent,
      indicatorBackgroundColor: Colors.white,
      height: 250,
      autoPlayInterval: 1500,
      indicatorRadius: 4,
      isLoop: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/cutesheep.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/cutesheep.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/cutesheep.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/cutesheep.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("images/cutesheep.jpg"),
        ),
      ],
    );
  }
}
