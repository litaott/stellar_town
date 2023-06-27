import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';

class RollingBox extends StatefulWidget {
  const RollingBox({super.key});

  @override
  State<StatefulWidget> createState() => RollingBoxState();
}

class RollingBoxState extends State<RollingBox>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      lowerBound: -1.0,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 10000),
      value: 0.0,
      vsync: this,
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: buildClipPath,
    );
  }

  Widget buildClipPath(BuildContext context, Widget? child) {
    return ClipPath(
      clipper: CustomHeaderClipPath(animationController.value),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.3,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorTheme.deepBlue, ColorTheme.lightBlue],
          ),
        ),
        child: const Center(
          child: Text(
            'Stellar Town',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHeaderClipPath extends CustomClipper<Path> {
  double progress;

  CustomHeaderClipPath(this.progress);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(0, size.height * 0.7);

    double controllerCenterX =
        size.width * 0.5 + (size.width * 0.6 + 1) * sin(progress * pi);
    double controllerCenterY = size.height * 0.8 + 70 * cos(progress * pi);

    path.quadraticBezierTo(
      controllerCenterX,
      controllerCenterY,
      size.width,
      size.height * 0.7,
    );

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
