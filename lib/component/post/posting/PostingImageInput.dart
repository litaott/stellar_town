import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stellar_town/main.dart';

/// 帖子图片上传部件
/// @author ww
/// @date 2023-06-29

class PostingImageInput extends StatefulWidget {

  List<File> imageFiles = [];

  @override
  PostingImageInputState createState() => PostingImageInputState();

}

class PostingImageInputState extends State<PostingImageInput> {

  void _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        widget.imageFiles.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.imageFiles.length,
          itemBuilder: (context, index) {
            Widget buildImageContainer(File imageFile) {
              return AspectRatio(
                aspectRatio: 1/1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width:screenWidth*0.005),),
                  child: Image.file(
                    imageFile,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
            if (index % 3 == 0) {
              // 新起一行，显示三张图片
              int endIndex = index + 3;
              if (endIndex > widget.imageFiles.length) {
                endIndex = widget.imageFiles.length;
              }
              List<File> rowImages =
              widget.imageFiles.sublist(index, endIndex); // 获取当前行的图片列表
              return Row(
                children: rowImages.map((imageFile) {
                  return Expanded(child: buildImageContainer(imageFile));
                }).toList(),
              );
            } else {
              // 留空，不显示图片
              return Container();
            }

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
