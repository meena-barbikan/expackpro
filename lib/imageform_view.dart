import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadImagePage extends StatefulWidget {
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? _image;

  // Pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Upload the image to Cloudinary
  Future<void> _uploadImage() async {
    // Check if an image is selected
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select an image first!"),
      ));
      return;
    }

    try {
      var uri = Uri.parse(
          'https://api.cloudinary.com/v1_1/YOUR_CLOUD_NAME/image/upload'); // Replace with your Cloudinary URL
      var request = http.MultipartRequest('POST', uri);

      // Add the image file to the request
      request.files.add(await http.MultipartFile.fromPath(
        'file', // The name of the field expected by Cloudinary
        _image!.path,
      ));

      // Add your Cloudinary API key and upload preset (make sure to use your own API credentials)
      request.fields['upload_preset'] =
          'YOUR_UPLOAD_PRESET'; // Replace with your upload preset

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Image uploaded successfully!"),
        ));
        print('Response: $responseData');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to upload image!"),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Image")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _image == null ? Text('No image selected.') : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
