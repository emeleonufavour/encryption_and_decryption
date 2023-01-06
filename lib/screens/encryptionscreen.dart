import 'dart:convert';
import 'package:encryption_app/services/encryptionservice.dart';
import 'package:encryption_app/widgets/dialog.dart';
import 'package:encryption_app/widgets/inputbox.dart';
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
        //message input
        InputBox(
            message: 'Type the message you want to encrpt',
            controller: mcontroller),
        //password input
        InputBox(message: "Create your password", controller: pcontroller),
        CupertinoButton(
            color: Colors.purple,
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
