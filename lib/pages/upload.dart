import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  PickedFile? _imageFile;
  dynamic? _pickerror;
  final picker = ImagePicker();
  _imgFromGallery() async {
    try {
      final image =
          await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
      setState(() {
        if (image != null) {
          _imageFile = image;
        }
      });
    } catch (e) {
      setState(() {
        _pickerror = e;
      });
    }
  }

  Widget preview() {
    if (_imageFile != null) {
      if (kIsWeb) {
        return Image.network(
          _imageFile!.path,
          fit: BoxFit.cover,
        );
      } else {
        return Semantics(
            child: Image.file(File(
              _imageFile!.path,
            )),
            label: 'image_picked_image');
      }
    } else if (_pickerror != null) {
      return Text(
        'Pick image error: $_pickerror',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          iconTheme: IconThemeData(
            color: Colors.black,
          )),
      body: Material(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    child: Center(child: preview()),
                    height: 350,
                    width: 650,
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  child: InkWell(
                    onTap: () {
                      _imgFromGallery();
                    },
                    // hoverColor: Colors.orange,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                      ),
                      height: 40,
                      width: 400,
                      child: Center(
                        child: Text(
                          "Upload Image",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
