import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gdg_app/make_story/uploader.dart';
import 'package:gdg_app/universal/dev_scaffold.dart';
import 'package:gdg_app/utils/gdgcasablanca.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  Future<void> _cropImage()async{
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It'
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
