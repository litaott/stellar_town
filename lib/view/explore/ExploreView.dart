import 'dart:convert';
import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/animation_controller_extension/animation_controller_extension.dart';
import 'package:simple_animations/animation_mixin/animation_mixin.dart';
import 'package:stellar_town/component/explore/InfoCards.dart';
import 'package:stellar_town/constant/CityData.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/entity/explore/Astronomy.dart';
import 'package:stellar_town/entity/explore/Weather.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';
import 'package:stellar_town/util/HttpUtil.dart';
import 'package:stellar_town/view/explore/AttractionView.dart';
import 'package:stellar_town/view/explore/SkyTransferView.dart';

import '../../component/explore/TimeAxis.dart';

/// 探索页面
/// @author tt
/// @date 2023-06-29

/// 当前城市
String city = '武汉';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  ExploreViewState createState() => ExploreViewState();
}

class ExploreViewState extends State<ExploreView> with AnimationMixin {
  /// 卡片边距
  double crossPadding = (screenWidth - len - wid) / 3 * 2;

  /// 动画类与控制器
  late Animation<double> dateIn, lenAni, widAni;
  late AnimationController cardCtrl, dateCtrl;

  @override
  void initState() {
    initAnimations();

    resetAllInfo();

    super.initState();
  }

  /// 获取天气、气象信息
  void resetAllInfo() {
    String cityPinyin = PinyinHelper.getPinyinE(city, separator: '');
    getWeather(cityPinyin).then(resetWeather);
    getAstronomy(cityPinyin).then(resetAstronomy);
  }

  /// 初始化动画
  void initAnimations() {
    cardCtrl = createController();
    dateCtrl = createController();
    dateIn = Tween(begin: -screenWidth, end: 0.0)
        .chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut))
        .animate(dateCtrl);
    lenAni = Tween(begin: 0.0, end: len)
        .chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut))
        .animate(cardCtrl);
    widAni = Tween(begin: 0.0, end: wid)
        .chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut))
        .animate(cardCtrl);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTitle(),
                  buildCards(),
                  Transform.translate(
                    offset: Offset(dateIn.value, 0),
                    child: buildAxis(),
                  ),
                ],
              ),
            ),
            const AttractionView(),
          ],
        ),
      ),
    );
  }

  Row buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayAnimationBuilder<double>(
              tween: Tween(begin: -100, end: 0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
              onCompleted: () {
                dateCtrl.play(duration: const Duration(milliseconds: 500));
                cardCtrl.play(duration: const Duration(milliseconds: 700));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ' >$city<',
                  style: TextStyleTheme.cityStyle,
                ),
              ),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: child,
                );
              },
            ),
            Transform.translate(
              offset: Offset(dateIn.value, 0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Chip(
                  label: Text(
                      formatDate(DateTime.now(), [yyyy, ' / ', mm, ' / ', dd])),
                  labelStyle: TextStyleTheme.dateStyle,
                  backgroundColor: ColorTheme.lightBlue,
                  elevation: 2,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Transform.translate(
            offset: Offset(0 - dateIn.value, 0),
            child: buildWeatherCard(),
          ),
        ),
      ],
    );
  }

  Widget buildCards() {
    return SizedBox(
      width: screenWidth,
      height: screenWidth,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned(
            right: wid + crossPadding,
            bottom: len + crossPadding,
            child: SizedBox(
              width: lenAni.value,
              height: widAni.value,
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topLeft,
                child: buildTempCard(),
              ),
            ),
          ),
          Positioned(
            left: len + crossPadding,
            bottom: wid + crossPadding,
            child: SizedBox(
              width: widAni.value,
              height: lenAni.value,
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topLeft,
                //clipBehavior: Clip.hardEdge,
                child: buildRainCard(),
              ),
            ),
          ),
          Positioned(
            right: len + crossPadding,
            top: wid + crossPadding,
            child: SizedBox(
              width: widAni.value,
              height: lenAni.value,
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topLeft,
                //clipBehavior: Clip.hardEdge,
                child: buildWindCard(),
              ),
            ),
          ),
          Positioned(
            left: wid + crossPadding,
            top: len + crossPadding,
            child: SizedBox(
              width: lenAni.value,
              height: widAni.value,
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topLeft,
                //clipBehavior: Clip.hardEdge,
                child: buildMoonCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      shadowColor: Colors.transparent,
      leading: IconButton(
        onPressed: pickCity,
        icon: const Icon(
          Icons.my_location_outlined,
          color: Colors.white,
        ),
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
      title: const Center(child: Text('探索')),
      actions: [
        InkWell(
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SkyTransferView();
                },
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'AI',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  /// 全部气象信息获取
  Future<Astronomy> getAstronomy(String city) async {
    String url1, url2, url3;
    Future<Map<String, dynamic>> data1, data2, data3;

    url1 = '${ConstUrl.getMoonPhaseByCityName}?cityName=$city';
    data1 = getAstronomyItem(url1, true);

    url2 = '${ConstUrl.getSpecialTimeByCityName}?cityName=$city';
    data2 = getAstronomyItem(url2, false);

    // url3 = '${ConstUrl.getTwilightByCityName}?cityName=$city';
    // data3 = getAstronomyItem(url3, false);

    List<Map<String, dynamic>> datas = await Future.wait([data1, data2]);

    // datas[1].addAll(datas[2]);
    datas[0].addAll(datas[1]);
    return Astronomy.fromMap(datas[0]);
  }

  /// 单个气象信息获取
  Future<Map<String, dynamic>> getAstronomyItem(String url, bool isList) async {
    Map<String, dynamic> data, body;
    Response response = await HttpUtil.getJson(url);
    body = response.data;
    if (body['code'] ~/ 100 == 2) {
      if (isList) {
        data = body['data'][0];
      } else {
        data = body['data'];
      }
    } else {
      data = {};
      log('$url:fail');
    }
    return data;
  }

  Future<Weather> getWeather(String city) async {
    String url;
    Response response;
    Map<String, dynamic> body, data;
    url = '${ConstUrl.getWeatherByCityName}?cityName=$city';
    response = await HttpUtil.getJson(url);
    body = response.data;
    if (body['code'] ~/ 100 == 2) {
      data = body['data'];
    } else {
      data = {};
      log('getWeatherByCityName:fail');
    }
    log(data.toString());
    return Weather.fromMap(data);
  }

  void resetAstronomy(Astronomy astro) {
    setState(() {
      astronomy = astro;
    });
  }

  void resetWeather(Weather wea) {
    setState(() {
      weather = wea;
    });
  }

  void pickCity() {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(
            pickerData: const JsonDecoder().convert(cityData)),
        changeToFirst: false,
        textAlign: TextAlign.left,
        height: 300,
        title: Text('当前城市：$city'),
        cancelText: '取消',
        confirmText: '确定',
        // textStyle: TextStyle(color: Colors.blue, fontFamily: _fontFamily),
        // selectedTextStyle: TextStyle(color: Colors.red),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          city = picker.getSelectedValues()[1];
          resetAllInfo();
          cardCtrl.reset();
          cardCtrl.play(
            duration: const Duration(milliseconds: 1000),
          );
        });
    picker.showBottomSheet(context);
    // picker.showDialog(context);
  }
}
