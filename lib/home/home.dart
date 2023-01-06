import 'dart:convert';

import 'package:encryption_app/services/encryptionservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController mcontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  String? encryptedMessage;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Text Encyption',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: CupertinoTextField(
                controller: mcontroller,
                style: const TextStyle(color: Colors.black),
                placeholder: 'Type the message you want to encrypt',
                placeholderStyle: const TextStyle(color: Colors.grey),
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                clearButtonMode: OverlayVisibilityMode.editing,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0,
                      color: CupertinoColors.systemGreen,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //password input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: CupertinoTextField(
                controller: pcontroller,
                style: const TextStyle(color: Colors.black),
                placeholder: 'Create a password',
                placeholderStyle: const TextStyle(color: Colors.grey),
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                clearButtonMode: OverlayVisibilityMode.editing,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0,
                      color: CupertinoColors.systemGreen,
                    ),
                  ),
                ),
              ),
            ),
          ),
          CupertinoButton(
              color: Colors.blue,
              child: const Text(
                'Encrypt',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Encryption.getEncryptedMessage(
                    mcontroller.text, pcontroller.text);
              })
        ],
      ),
    );
  }
}
