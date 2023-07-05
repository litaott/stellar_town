import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/entity/explore/Attraction.dart';
import 'package:stellar_town/util/HttpUtil.dart';
import 'package:stellar_town/view/explore/ExploreView.dart';

/// 景点页面
/// @author tt
/// @date 2023-07-05

List<Attraction> attractions = [
  Attraction(image: ConstUrl.defaultAvatar),
  Attraction(image: ConstUrl.defaultAvatar),
  Attraction(image: ConstUrl.defaultAvatar),
  Attraction(image: ConstUrl.defaultAvatar),
];
double cardAspectRatio = 12.0 / 16.0;
double widgetAspectRatio = cardAspectRatio * 1.2;

class AttractionView extends StatefulWidget {
  const AttractionView({super.key});

  @override
  State<AttractionView> createState() => AttractionViewState();
}

class AttractionViewState extends State<AttractionView> {
  // double currentPage = attractions.length - 1.0;
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    // getAttractions();
  }

  @override
  Widget build(BuildContext context) {
    return buildPage();
  }

  Widget buildPage() {
    PageController controller =
        PageController(initialPage: attractions.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    return Stack(
      children: [
        CardScrollWidget(currentPage),
        Positioned.fill(
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        ),
      ],
    );
  }

  void getAttractions() async {
    String url;
    Response response;
    Map<String, dynamic> body;
    List<dynamic> data;
    url = '${ConstUrl.getAttractionByCityName}?cityName=$city';
    response = await HttpUtil.getJson(url);
    body = response.data;
    if (body['code'] ~/ 100 == 2) {
      data = body['data'];
      attractions.clear();
      for (int i = 0; i < data.length; i++) {
        attractions.add(Attraction.fromMap(data[i]));
      }
      setState(() {});
    } else {
      attractions = [];
    }
  }
}

class CardScrollWidget extends StatelessWidget {
  final double currentPage;
  final double padding = 20.0;
  final double verticalInset = 20.0;

  const CardScrollWidget(this.currentPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;

          double safeWidth = width - padding * 2;
          double safeHeight = height - padding * 2;

          double heightOfPrimaryCard = safeHeight;
          double widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          double primaryCardLeft = safeWidth - widthOfPrimaryCard;
          double horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (int i = 0; i < attractions.length; i++) {
            double delta = i - currentPage;
            bool isOnRight = delta > 0;

            double start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);

            Widget cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: Container(
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
