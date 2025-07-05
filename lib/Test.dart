import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  ImagePicker picker = ImagePicker();

  saveImage() async {
    await picker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () async {
            await saveImage();
          },
        ),
      ),
    ));
  }
}
