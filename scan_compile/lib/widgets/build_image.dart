import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BuildImage extends StatelessWidget {
  final File pickedImage;
  BuildImage(@required this.pickedImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(pickedImage), fit: BoxFit.contain)),
    );
  }
}
