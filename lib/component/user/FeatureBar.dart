import 'package:flutter/material.dart';
import 'package:stellar_town/main.dart';

class FeatureBar extends StatelessWidget {
  const FeatureBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.9,
      height: 60,
      decoration: BoxDecoration(
        // border: Border.all(
        //   width: 2,
        // ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.thumb_up_rounded),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.star_border_rounded),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.star_border_rounded),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.thumb_up_rounded),
          ),
        ],
      ),
    );
  }
}
