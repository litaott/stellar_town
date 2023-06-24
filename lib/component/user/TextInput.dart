import 'package:flutter/material.dart';

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
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        icon: Icon(icon),
      ),
      obscureText: obscureText,
    );
  }
}
