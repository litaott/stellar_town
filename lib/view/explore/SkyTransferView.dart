import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';

/// AI一键换天页面
/// @author tt
/// @date 2023-07-05

class SkyTransferView extends StatefulWidget {
  const SkyTransferView({super.key});

  @override
  SkyTransferViewState createState() => SkyTransferViewState();
}

class SkyTransferViewState extends State<SkyTransferView> {
  int status = 0; //页面状态
  String imgPath = ''; //选择的图片路径
  late File selectedImg; //选择的图片文件
  List<String> masks = [
    '落日残阳',
    '悬浮城堡',
    '梦幻飞船',
    '木星守护',
    '丝缕阳光',
    '超级月亮',
    '蓝调'
  ]; //模板列表
  String selectedMaskId = '1'; //选择的模板id
  late String selectedMask; //选择的模板
  late Uint8List transImg; //处理过后的图片文件（二进制）

  @override
  Widget build(BuildContext context) {
    selectedMask = masks[int.parse(selectedMaskId) - 1];
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              buildDropdown(),
              buildImgSelector(),
              buildSelectedImg(),
              buildUpload(),
              buildTransImg(),
            ],
          ),
        ),
      ),
    );
  }

  /// appbar
  AppBar buildAppBar() {
    return AppBar(
      shadowColor: Colors.transparent,
      leading: BackButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorTheme.blue, ColorTheme.lightBlue],
          ),
        ),
      ),
      title: const Center(child: Text('AI一键换天')),
      actions: const [
        Padding(
          padding: EdgeInsets.all(16.0),
        ),
      ],
    );
  }

  /// 下拉框选择模板
  Row buildDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton<String>(
          hint: const Text(
            '请选择模板',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          borderRadius: BorderRadius.circular(12),
          elevation: 4,
          onChanged: (String? newId) {
            setState(() {
              selectedMaskId = newId!;
            });
          },
          items: const [
            DropdownMenuItem(
              value: '1',
              child: Text('落日残阳'),
            ),
            DropdownMenuItem(
              value: '2',
              child: Text('悬浮城堡'),
            ),
            DropdownMenuItem(
              value: '3',
              child: Text('梦幻飞船'),
            ),
            DropdownMenuItem(
              value: '4',
              child: Text('木星守护'),
            ),
            DropdownMenuItem(
              value: '5',
              child: Text('丝缕阳光'),
            ),
            DropdownMenuItem(
              value: '6',
              child: Text('超级月亮'),
            ),
            DropdownMenuItem(
              value: '7',
              child: Text('蓝色幻想'),
            ),
          ],
        ),
        Container(
          width: screenWidth * 0.5,
          alignment: Alignment.center,
          child: Text(selectedMask),
        ),
      ],
    );
  }

  /// 图片选择
  Row buildImgSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: pickImageFromGallery,
          child: const Text('选择一张图片'),
        ),
        SizedBox(
          width: screenWidth * 0.5,
          child: Text(
            imgPath,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// 原始图片展示
  Widget buildSelectedImg() {
    if (status == 0) {
      return Container();
    } else {
      double ratio = 0.5;
      return ClipRRect(
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: screenWidth * 0.9,
          height: screenWidth * 0.9 * 480 / 845,
          child: Image.file(
            selectedImg,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }
  }

  /// 上传按钮
  Row buildUpload() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: uploadImg,
          child: Text('上传图片'),
        ),
      ],
    );
  }

  /// 处理后图片展示
  Widget buildTransImg() {
    if (status == 0 || status == 1) {
      return Container();
    } else if (status == 2) {
      return Container(
        height: screenHeight * 0.2,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    } else {
      return Container(
        width: screenWidth * 0.9,
        height: screenWidth * 0.9 * 480 / 845,
        alignment: Alignment.center,
        child: Image.memory(transImg),
      );
    }
  }

  /// 用户选择图片
  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImg = File(image.path);
      setState(() {
        imgPath = image.path;
        status = 1;
      });
    }
  }

  /// 上传图片响应函数
  Future<void> uploadImg() async {
    setState(() {
      status = 2;
    });
    // Map<String, dynamic> formData = {
    //   'file': selectedImg,
    //   'maskId': selectedMaskId
    // };
    // log(formData.toString());
    // Dio dio = Dio();
    // dio.options.contentType = 'multipart/form-data';
    // Response response = await dio.post(ConstUrl.getSkyTransfer,
    //     data: FormData.fromMap(formData));
    // ByteData img = response.data;
    // setState(() {
    //   transImg = Uint8List.fromList(base64.decode(img));
    //   status = 2;
    // });
    var url = Uri.parse(ConstUrl.getSkyTransfer);

    // 创建一个多部分请求
    var request = http.MultipartRequest('POST', url);

    // 添加文本字段
    request.fields['maskId'] = selectedMaskId;

    // 添加文件字段
    var file = await http.MultipartFile.fromPath(
      'file',
      imgPath,
      contentType: MediaType('image', 'jpeg'),
    );
    request.files.add(file);

    // 发送请求并获取响应
    var response = await request.send();

    // 读取响应内容
    transImg = await response.stream.toBytes();
    setState(() {
      status = 3;
    });
  }
}
