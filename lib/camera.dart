// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

import 'package:cloudinary_public/cloudinary_public.dart';

final cloudinary = CloudinaryPublic('dspzxkrhd', 'wqz9vjdx', cache: false);
String imageUrl = '';

class PickImage extends StatefulWidget {
  final void Function(Uint8List) onImageSelected;
  const PickImage({super.key, required this.onImageSelected});
  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Stack(
          children: [
            _image != null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2264922221.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  showImagePickerOption(context);
                },
                icon: const Icon(Icons.add_a_photo),
                iconSize: 45.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImagefromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.image, size: 70),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImagefromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.camera_alt, size: 70),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<String> _pickImagefromGallery() async {
  final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(pickedFile.path,
            resourceType: CloudinaryResourceType.Image),
      );

      // Use the image URL here or save it to a variable
      imageUrl = response.secureUrl;
      print(imageUrl);

      // Return the image URL
      return imageUrl;
    } catch (e) {
      print("Error uploading image to Cloudinary: $e");
      // Return an empty string or handle the error accordingly
      return '';
    }
  }

  // Return an empty string in case of no image selected
  return '';
}

Future<String> _pickImagefromCamera() async {
  final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
  if (pickedFile != null) {
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(pickedFile.path,
            resourceType: CloudinaryResourceType.Image),
      );

      // Use the image URL here or save it to a variable
      imageUrl = response.secureUrl;
      print(imageUrl);

      // Return the image URL
      return imageUrl;
    } catch (e) {
      print("Error uploading image to Cloudinary: $e");
      // Return an empty string or handle the error accordingly
      return '';
    }
  }

  // Return an empty string in case of no image selected
  return '';
}
