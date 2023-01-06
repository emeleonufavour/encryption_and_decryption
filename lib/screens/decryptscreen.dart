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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              clearButtonMode: OverlayVisibilityMode.editing,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: Colors.grey)),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              clearButtonMode: OverlayVisibilityMode.editing,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: Colors.grey)),
            ),
          ),
        ),
        CupertinoButton(
            color: Colors.purple,
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
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width) * 0.7,
          child: GestureDetector(
              child: decryptedMessage == null
                  ? const Text(
                      'Your decrypted message will go here',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      '${decryptedMessage}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
        )
      ],
    );
  }
}
