import 'dart:convert';
import 'package:encryption_app/screens/decryptscreen.dart';
import 'package:encryption_app/screens/encryptionscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController mcontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  String? encryptedMessage;
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Text cryptography',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      child: Column(
        children: [
          const Center(
            child: Text('Flip the switch to encrypt or decrypt a message'),
          ),
          CupertinoSwitch(
            activeColor: Colors.purple,
            value: _isOn,
            onChanged: (bool value) {
              setState(() {
                _isOn = value;
              });
            },
          ),
          _isOn ? DecryptPage() : EncryptionScreen(),
        ],
      ),
    );
  }
}
