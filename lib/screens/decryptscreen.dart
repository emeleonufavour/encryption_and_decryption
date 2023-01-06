import 'dart:convert';

import 'package:encryption_app/services/decryptservice.dart';
import 'package:encryption_app/services/encryptionservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DecryptPage extends StatefulWidget {
  const DecryptPage({super.key});

  @override
  State<DecryptPage> createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
  TextEditingController mcontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  String? decryptedMessage;

  @override
  void dispose() {
    mcontroller.dispose();
    pcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: CupertinoTextField(
              controller: mcontroller,
              style: const TextStyle(color: Colors.black),
              placeholder: 'Enter the message you want to decrypt',
              placeholderStyle: const TextStyle(color: Colors.grey),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
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
              placeholder: 'Type the password',
              placeholderStyle: const TextStyle(color: Colors.grey),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
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
              'Decrypt',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              final message = await Decryption.getDecryptedMessage(
                  mcontroller.text, pcontroller.text);
              setState(() {
                decryptedMessage = message;
                mcontroller.clear();
                pcontroller.clear();
              });
              print('message: $message');
            }),
      ],
    );
  }
}
