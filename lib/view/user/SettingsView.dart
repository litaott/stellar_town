import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constant/ConstUrl.dart';
import '../../util/HttpUtil.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  String _donateImageUrl = 'http://101.37.252.1:9999/stellar-town/donate/IMG_5831%2820230627-155904%29.JPG';
  final TextEditingController _donateController = TextEditingController();


  void _getImage() async {
    // 获取捐赠图片
    Map body = {
      'donate': _donateController.text,
    };

    Response response = await HttpUtil.post(ConstUrl.donate, body);
    _donateImageUrl = response.data['data'];
    print(_donateImageUrl);

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //_getImage();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              _donateImageUrl,
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              '感谢您对我们的支持!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}