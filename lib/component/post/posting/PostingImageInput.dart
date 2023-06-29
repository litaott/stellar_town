import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 帖子图片上传部件
/// @author ww
/// @date 2023-06-29

class PostingImageInput extends StatefulWidget {
  const PostingImageInput({super.key});

  @override
  _PostingImageInputState createState() => _PostingImageInputState();
}

class _PostingImageInputState extends State<PostingImageInput> {
  List<File> imageFiles = [];

  void _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFiles.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: imageFiles.length,
          itemBuilder: (context, index) {
            return Image.file(imageFiles[index]);
          },
        ),
        ElevatedButton(
          onPressed: _pickImage,
          child: const Text('添加图片'),
        ),
      ],
    );
  }
}