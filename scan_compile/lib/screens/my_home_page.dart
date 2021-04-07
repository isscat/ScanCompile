import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan_compile/widgets/build_image.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage;
  var imageFile;
  bool isImageLoaded = false;
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => invokeGallery(),
          child: (!isImageLoaded)
              ? Image.asset('assets/camera.png')
              : buildColumn(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: readText,
        child: Icon(Icons.check),
      ),
    );
  }

  void invokeGallery() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.gallery);
    print(tempStore.path);
    setState(() {
      pickedImage = File(tempStore.path);
      isImageLoaded = true;
    });
  }

  void readText() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(myImage);
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          print(word.text);
        }
      }
    }
  }

  Widget buildColumn() {
    return Center(
      child: Container(
        child: Column(
          children: [
            BuildImage(pickedImage),
          ],
        ),
      ),
    );
  }
}
