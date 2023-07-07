import 'dart:developer' as dev;
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/entity/explore/Attraction.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';
import 'package:stellar_town/util/HttpUtil.dart';
import 'package:stellar_town/view/explore/ExploreView.dart';

/// 景点页面
/// @author tt
/// @date 2023-07-05

List<Attraction> attractions = [
  Attraction(),
  Attraction(),
  Attraction(),
]; //景点列表
double cardAspectRatio = 4.0 / 3.0; //景点图片长宽比
double widgetAspectRatio = cardAspectRatio * 1.1; //景点图片外容器长宽比

class AttractionView extends StatefulWidget {
  const AttractionView({super.key});

  @override
  State<AttractionView> createState() => AttractionViewState();
}

class AttractionViewState extends State<AttractionView> {
  double currentPage = attractions.length - 1.0; //当前页面

  @override
  void initState() {
    super.initState();
    getAttractions();
  }

  @override
  Widget build(BuildContext context) {
    return buildPage();
  }

  Widget buildPage() {
    PageController controller = PageController(initialPage: 0); //页面控制器
    controller.addListener(() {
      setState(() {
        currentPage = attractions.length - controller.page! - 1;
      });
    });

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.07,
        ),
        Expanded(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight * 0.5,
            child: Stack(
              children: [
                CardScrollWidget(currentPage % attractions.length),
                PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: controller,
                  itemCount: 10000,
                  itemBuilder: (context, index) {
                    return buildInfos(
                        (attractions.length - index - 1) % attractions.length);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 景点相关信息
  Padding buildInfos(int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenWidth / widgetAspectRatio,
          ),
          Text(
            attractions[index].name,
            style: TextStyleTheme.attractionNameStyle,
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              Text(
                attractions[index].address,
                style: TextStyleTheme.introductionStyle,
              ),
            ],
          ),
          Chip(
            label: Text(
                '距离当前城市【$city】${attractions[index].distance.substring(0, attractions[index].distance.length - 10)}km'),
            labelStyle: TextStyleTheme.distanceStyle,
            backgroundColor: ColorTheme.moreLightBlue,
            elevation: 1,
          ),
          Text(
            attractions[index].introduction,
            style: TextStyleTheme.introductionStyle,
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
        ],
      ),
    );
  }

  /// 获取景点信息
  void getAttractions() async {
    String url;
    Response response;
    Map<String, dynamic> body;
    List<dynamic> data;
    url = '${ConstUrl.getAttractionByCityName}?address=$city';
    response = await HttpUtil.getJson(url);
    body = response.data;
    if (body['code'] ~/ 100 == 2) {
      data = body['data'];
      dev.log(data.toString());
      attractions.clear();
      for (int i = 0; i < data.length; i++) {
        attractions.add(Attraction.fromMap(data[i]));
      }
      setState(() {});
    } else {
      attractions = [];
      dev.log('getAttractionByCityName:fail');
    }
  }
}

class CardScrollWidget extends StatelessWidget {
  final double currentPage; //当前页面
  final double padding = 15.0; //边距
  final double verticalInset = 15.0; //垂直方向偏移

  const CardScrollWidget(this.currentPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imgWidth = constraints.maxWidth;
          double imgHeight = constraints.maxHeight;

          double safeWidth = imgWidth - padding * 2;
          double safeHeight = imgHeight - padding * 2;

          double heightOfPrimaryCard = safeHeight;
          double widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          double primaryCardLeft = safeWidth - widthOfPrimaryCard;
          double horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (int j = -2; j < attractions.length; j++) {
            double delta = j - currentPage;

            int i;
            if (j < 0) {
              i = attractions.length + j;
            } else {
              i = j;
            }

            bool isOnRight = delta > 0;

            double start = padding +
                math.max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0,
                );

            Widget cardItem = Positioned.directional(
              top: padding + verticalInset * math.max(-delta, 0.0),
              bottom: padding + verticalInset * math.max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 16,
                        spreadRadius: 16,
                        color: Color.fromARGB(35, 0, 0, 0),
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          attractions[i].image,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
