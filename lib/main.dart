import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.grey[100],
          barBackgroundColor: Colors.grey[100]),
      home: HomePage(),
    );
  }
}
