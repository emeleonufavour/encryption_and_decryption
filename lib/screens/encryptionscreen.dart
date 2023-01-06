import 'dart:convert';
import 'package:encryption_app/services/encryptionservice.dart';
import 'package:encryption_app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EncryptionScreen extends StatefulWidget {
  const EncryptionScreen({super.key});

  @override
  State<EncryptionScreen> createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  TextEditingController mcontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  String? encryptedMessage;

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
              placeholder: 'Type the message you want to encrypt',
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
              placeholder: 'Create a password',
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
              'Encrypt',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              final message = await Encryption.getEncryptedMessage(
                  mcontroller.text, pcontroller.text);
              setState(() {
                encryptedMessage = message;
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
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: encryptedMessage));
                showCupertinoDialog(
                    context: context,
                    builder: ((context) {
                      return DialogBox();
                    }));
              },
              child: encryptedMessage == null
                  ? const Text(
                      'Your encrypted message will go here',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      '${encryptedMessage}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
        )
      ],
    );
  }
}
