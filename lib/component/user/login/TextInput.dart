import 'package:flutter/material.dart';
import 'package:stellar_town/theme/ColorTheme.dart';

/// 输入框组件
/// @author tt
/// @date 2023-06-24

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 80,
      decoration: const BoxDecoration(),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: ColorTheme.blue,
            ),
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
