import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gdg_app/make_story/uploader.dart';
import 'package:gdg_app/universal/dev_scaffold.dart';
import 'package:gdg_app/utils/gdgcasablanca.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edge_detection/edge_detection.dart';

class ImageCapture extends StatefulWidget {
  static const String routeName = "/imageCap";
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  //Active image file
  File _imageFile;

  //Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async{
    File selectedImage ;
    String selected = await EdgeDetection.detectEdge;
    if (source == ImageSource.gallery) {
      selectedImage = await ImagePicker.pickImage(source: source);
    }
    setState(() {
      _imageFile = selectedImage;
    });
  }

  Future<void> _cropImage()async{
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  // Remobe image

  void _clear(){
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "Take Story",
      bottomNavBar:  BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: ()=> _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: ()=> _pickImage(ImageSource.gallery),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if(_imageFile != null) ...[
            Image.file(_imageFile),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                )
              ],
            ),
            Uploader(file : _imageFile)
          ]
        ],
      ),
    );
  }
}
