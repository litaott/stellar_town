import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stellar_town/component/explore/InfoCards.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';
import 'package:timelines/timelines.dart';

/// 时间轴相关卡片
/// @author tt
/// @date 2023-07-03

double width = screenWidth * 0.93;
double height = screenHeight * 0.2;
double cardHeight = height * 0.9;
double axisWidth = width - 40;
double axisHeight = cardHeight - 40;

/// 时间轴样式
DecoratedLineConnector connector = const DecoratedLineConnector();
DotIndicator indicator = const DotIndicator(size: 8);
TimelineNode node = TimelineNode(indicator: indicator);

/// 时刻文字
Widget buildContent(String name, String text) {
  return Column(
    children: [
      Text(name),
      Text(text),
    ],
  );
}

/// 获取时间点对应比值
double getPosition(String time) {
  if (time.contains(':')) {
    List<String> timeParts = time.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    int totalMinutes = (hours * 60) + minutes;
    double ratio = totalMinutes / (24 * 60);
    return ratio;
  } else {
    return 0.0;
  }
}

/// 页面控制器
PageController pageController =
    PageController(viewportFraction: 1, keepPage: true);

/// 创建时间轴滚动页面
Widget buildAxis() {
  /// 页面集合
  List<Widget> pages = [buildSpecialHourCard(), buildDawnHourCard()];
  return Container(
    width: width + 20,
    height: height,
    alignment: Alignment.center,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width,
            height: cardHeight,
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: pages.length,
            effect: const WormEffect(
              activeDotColor: ColorTheme.blue,
              dotHeight: 8,
              dotWidth: 8,
              type: WormType.thin,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildSpecialHourCard() {
  String time1 = astronomy.blueHourAMStart;
  String time2 = astronomy.blueHourPMStart;
  String time3 = astronomy.goldenHourAMStart;
  String time4 = astronomy.goldenHourPMStart;

  double position1 = getPosition(time1);
  double position2 = getPosition(time2);
  double position3 = getPosition(time3);
  double position4 = getPosition(time4);

  return Card(
    elevation: 4,
    margin: EdgeInsets.zero,
    child: Container(
      width: width,
      height: cardHeight,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TimelineTile(
            direction: Axis.horizontal,
            mainAxisExtent: axisWidth,
            node: TimelineNode(
              startConnector: connector,
              endConnector: connector,
            ),
          ),
          Positioned(
            left: axisWidth * position1,
            child: node,
          ),
          Positioned(
            left: axisWidth * position1 - 10,
            top: axisHeight * 0.6,
            child: buildContent('蓝调', time1),
          ),
          Positioned(
            left: axisWidth * position2,
            child: node,
          ),
          Positioned(
            left: axisWidth * position2 - 10,
            top: axisHeight * 0.6,
            child: buildContent('蓝调', time2),
          ),
          Positioned(
            left: axisWidth * position3,
            child: node,
          ),
          Positioned(
            left: axisWidth * position3 - 20,
            top: axisHeight * 0.15,
            child: buildContent('黄金时段', time3),
          ),
          Positioned(
            left: axisWidth * position4,
            child: node,
          ),
          Positioned(
            left: axisWidth * position4 - 20,
            top: axisHeight * 0.15,
            child: buildContent('黄金时段', time4),
          ),
        ],
      ),
    ),
  );
}

Widget buildDawnHourCard() {
  String time1 = astronomy.sunRiseTime;
  String time2 = astronomy.sunSetTime;
  String time3 = astronomy.moonRiseTime;
  String time4 = astronomy.moonSetTime;

  double position1 = getPosition(time1);
  double position2 = getPosition(time2);
  double position3 = getPosition(time3);
  double position4 = getPosition(time4);

  return Card(
    elevation: 4,
    margin: EdgeInsets.zero,
    child: Container(
      width: width,
      height: cardHeight,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TimelineTile(
            direction: Axis.horizontal,
            mainAxisExtent: axisWidth,
            node: TimelineNode(
              startConnector: connector,
              endConnector: connector,
            ),
          ),
          Positioned(
            left: axisWidth * position1,
            child: node,
          ),
          Positioned(
            left: axisWidth * position1 - 15,
            top: axisHeight * 0.6,
            child: buildContent('日出', time1),
          ),
          Positioned(
            left: axisWidth * position2,
            child: node,
          ),
          Positioned(
            left: axisWidth * position2 - 15,
            top: axisHeight * 0.6,
            child: buildContent('日落', time2),
          ),
          Positioned(
            left: axisWidth * position3,
            child: node,
          ),
          Positioned(
            left: axisWidth * position3 - 10,
            top: axisHeight * 0.15,
            child: buildContent('月出', time3),
          ),
          Positioned(
            left: axisWidth * position4,
            child: node,
          ),
          Positioned(
            left: axisWidth * position4 - 10,
            top: axisHeight * 0.15,
            child: buildContent('月落', time4),
          ),
        ],
      ),
    ),
  );
}
