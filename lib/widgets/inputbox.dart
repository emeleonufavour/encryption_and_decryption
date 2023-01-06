import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputBox extends StatelessWidget {
  final String message;
  TextEditingController controller;
  InputBox({required this.message, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: CupertinoTextField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          placeholder: message,
          placeholderStyle: const TextStyle(color: Colors.grey),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          clearButtonMode: OverlayVisibilityMode.editing,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              border: Border.all(color: Colors.grey)),
        ),
      ),
    );
  }
}
