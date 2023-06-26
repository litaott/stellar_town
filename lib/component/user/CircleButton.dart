import 'package:flutter/material.dart';
import 'package:stellar_town/theme/ColorTheme.dart';

/// 圆形按钮组件
/// @author tt
/// @date 2023-06-24

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: ColorTheme.blue,
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ColorTheme.deepBlue, ColorTheme.lightBlue],
        ),
      ),
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
