import 'dart:convert';

import 'package:encryption_app/services/decryptservice.dart';
import 'package:encryption_app/services/encryptionservice.dart';
import 'package:encryption_app/widgets/inputbox.dart';
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
        //enter encrypted message
        InputBox(
            message: 'Enter the message you want to decrypt',
            controller: mcontroller),
        //password input
        InputBox(message: 'Type the password', controller: pcontroller),
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
