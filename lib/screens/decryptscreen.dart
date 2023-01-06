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
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Text Decryption',
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
                placeholder: 'Enter the message you want to decrypt',
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
                'Decrypt',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                final message = await Decryption.getDecryptedMessage(
                    mcontroller.text, pcontroller.text);
                setState(() {
                  decryptedMessage = message;
                });
                print('message: $message');
              }),
          Text(
            'A',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          CupertinoSwitch(
            value: _isOn,
            activeColor: CupertinoColors.activeBlue,
            onChanged: (bool? value) {
              // This is called when the user toggles the switch.
              setState(() {
                _isOn = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}
