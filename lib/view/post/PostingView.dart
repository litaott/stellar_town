import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/posting/PostingImageInput.dart';
import '../../component/Navigation.dart';
import '../../component/post/posting/PostingWordInput.dart';
import '../../constant/ConstUrl.dart';
import '../../util/HttpUtil.dart';

/// 帖子发表界面
/// @author ww
/// @date 2023-07-05

class PostingView extends StatefulWidget {
  const PostingView({Key? key}) : super(key: key);

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
            PostingImageInput(),//图片
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



  void posting() async {
    title=titleController.text.toString();
    content=contentController.text.toString();
    place=placeController.text.toString();
    tag=tagController.text.toString();
    Map body = {
      'title': title,
      'content': content,
      'address':place,
      'tag':tag,
    };///非图片提交内容
    Response response = await HttpUtil.postJson(ConstUrl.post, body);///非图片回应
    Map postingResponse = response.data;

    Map body2={
      'post':PostingImageInput().imageFiles,
      'postId': postingResponse['postId'],
    };///图片提交
    if (postingResponse['code'] ~/ 100 == 2) {
      Response response = await HttpUtil.postForm(ConstUrl.uploadPost, body2);///图片回应
      Map imageResponse=response.data;
      if (imageResponse['code'] ~/ 100 == 2) {postingSuccess();}
      else{postingFail(body2['message']);}
    }
    else{postingFail(body['message']);}
  }

  /// 发表成功弹窗
  void postingSuccess() {
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
                      return const Navigation();
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
  void postingFail(String message) {
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
  }

}

