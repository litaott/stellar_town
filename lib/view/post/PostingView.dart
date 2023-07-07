import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stellar_town/view/post/PostHomeView.dart';
import '../../component/Navigation.dart';
import '../../component/post/posting/PostingWordInput.dart';
import '../../constant/ConstUrl.dart';
import '../../main.dart';
import '../../util/HttpUtil.dart';

/// 帖子发表界面
/// @author ww
/// @date 2023-07-05

class PostingView extends StatefulWidget {
  PostingView({Key? key}) : super(key: key);

  List<File> imageFiles = [];

  @override
  PostingViewState createState() =>PostingViewState();
}

class PostingViewState extends State<PostingView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  late String title, content,place,tag;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          leading:InkWell(
            child: const Center(child: Text('返回')),
            onTap: () {Navigator.pop(context);},
          ),//返回
          actions: [AspectRatio(
              aspectRatio:1,//组件长宽比为1
              child: InkWell(
                onTap: posting,
                child: const Center(child: Text('发表')),
              ),
            ),],//发表
        ),
        body: ListView(
          children: [
            PostingWordInput2(
              controller: titleController,
              hintText: '请输入标题',
              maxLine:1,
              rowName: '标题',
            ), //标题
            PostingWordInput2(
              controller: contentController,
              hintText: '请输入内容',
              maxLine:5,
              rowName: '内容',
            ),//内容
        Column(
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
        ),//图片
            PostingWordInput2(
              controller: placeController,
              hintText: '请输入地点',
              maxLine:1,
              rowName: '地点',
            ),//地点
            PostingWordInput2(
              controller: tagController,
              hintText: '请输入标签',
              maxLine:1,
              rowName: '标签',
            ),//标签
          ],
        )
      ),
    );
  }

  void _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        widget.imageFiles.add(File(pickedFile.path));
      });
    }
  }


  void posting() async {
    title = titleController.text.toString();
    content = contentController.text.toString();
    place = placeController.text.toString();
    tag = tagController.text.toString();
    Map body = {
      'title': title,
      'content': content,
      'address': place,
      'tag': tag,
    };

    ///非图片提交内容
    Response response = await HttpUtil.postJson(ConstUrl.post, body);

    ///非图片回应
    Map postingResponse = response.data;
    if (postingResponse['code'] ~/ 100 == 2) {
      log('非图片提交成功');
      /*if (widget.image !=null) {
        Map<String,dynamic> body2 = {
          'post': widget.image,
          'postId': postingResponse['data'],
        };*/
      String token = HttpUtil.token;
      if (widget.imageFiles[0] !=null){
        ///图片提交
        log('图片提交请求');
        // 构建请求体
        var request = http.MultipartRequest('POST', Uri.parse('http://101.37.252.1:8080${ConstUrl.uploadPost}'));
        request.fields['postId'] = postingResponse['data'].toString();
        request.headers['Authorization'] = token;
        request.files.add(await http.MultipartFile.fromPath('post', (widget.imageFiles[0].path), contentType: MediaType('image', 'jpeg') ));

        // 发送请求并获取响应
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        var imageUrl = streamedResponse.stream.toString();

        // 处理响应
        if (response.statusCode == 200) {
          var responseData = response.body;
          Map<String, dynamic> decodedData = jsonDecode(responseData);
          int code = decodedData['code'];
          if (code ~/ 100 == 2) {
            log('图片提交成功');
            log(decodedData['data']);
            postingSuccess();
          } else {
            log('图片提交失败');
          }
        } else {
          log('图片提交申请失败');
        }
        /*Response response2 = await HttpUtil.postForm(ConstUrl.uploadPost, body2);
        if (response2.data['code'] ~/ 100 == 2) {
          postingSuccess();
          log('图片提交请求成功');
        }
        else {
          postingFail(body2['message']);
          log('图片提交请求失败');
        }*/
      } else {
        log('无图片');
      }
    } else {
      log('非图片提交失败');
      log(postingResponse['message']);
    }
  }
  /// 发表成功弹窗
  void postingSuccess() {
    log('发送弹窗');
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('发表成功'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PostHomeView();
                    },
                  ),
                );
              },
              child: const Text('确定'),
            )
          ],
        );
      },
    );
  }
  /// 发表失败弹窗
 /* void postingFail(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('发表失败'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('确定'),
            )
          ],
        );
      },
    );
  }*/

}

