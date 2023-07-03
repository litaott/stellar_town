import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stellar_town/constant/QIcons.dart';
import 'package:stellar_town/entity/explore/Astronomy.dart';
import 'package:stellar_town/entity/explore/Weather.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';

/// 天气信息卡片
/// @author tt
/// @date 2023-06-30

Weather weather = Weather();
Astronomy astronomy = Astronomy();
double len = screenWidth * 0.5;
double wid = screenWidth * 0.4;
RoundedRectangleBorder borderRadius = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(24),
  ),
);

Widget buildWeatherCard() {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather.temp,
              style: TextStyleTheme.tempStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                String.fromCharCode(0x2103),
                //style: TextStyleTheme.infoCardStyle,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            QIcons.fromCode(weather.icon),
            Text(
              weather.text,
              style: TextStyleTheme.weatherTextStyle,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildTempCard() {
  return Card(
    color: ColorTheme.lightBlue,
    shadowColor: ColorTheme.lightBlue,
    elevation: 4,
    margin: EdgeInsets.zero,
    shape: borderRadius,
    child: Container(
      width: len,
      height: wid,
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                QIcons.temp,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '体感温度:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.feelsLike}${String.fromCharCode(0x2103)}',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '气压:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.pressure} hPa',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '能见度:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.vis} km',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildRainCard() {
  return Card(
    color: ColorTheme.blue,
    shadowColor: ColorTheme.blue,
    elevation: 4,
    margin: EdgeInsets.zero,
    shape: borderRadius,
    child: Container(
      width: wid,
      height: len,
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                QIcons.rain,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '相对湿度:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.humidity}%',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '降水量:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.precip}mm',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '云量:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.cloud}%',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '露点温度:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.dew}${String.fromCharCode(0x2103)}',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildWindCard() {
  return Card(
    color: ColorTheme.blue,
    shadowColor: ColorTheme.blue,
    elevation: 4,
    margin: EdgeInsets.zero,
    shape: borderRadius,
    child: Container(
      width: wid,
      height: len,
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                QIcons.wind,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              Text(
                weather.windDir,
                style: TextStyleTheme.cardTitleStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '风向角度:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.wind360}${String.fromCharCode(0x00B0)}',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '风力等级:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                weather.windScale,
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '风速:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${weather.windSpeed} km/h',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildMoonCard() {
  return Card(
    color: ColorTheme.lightBlue,
    shadowColor: ColorTheme.lightBlue,
    elevation: 4,
    margin: EdgeInsets.zero,
    shape: borderRadius,
    child: Container(
      width: len,
      height: wid,
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.rotate(
                angle: pi * 3 / 2,
                child: const Icon(
                  QIcons.moon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '月相:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                astronomy.name,
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '月相值:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                astronomy.value,
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '明亮度:',
                style: TextStyleTheme.infoCardStyle,
              ),
              Text(
                '${astronomy.illumination}%',
                style: TextStyleTheme.infoCardStyle,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
