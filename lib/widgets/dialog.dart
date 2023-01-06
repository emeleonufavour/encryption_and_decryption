import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
        title: const Text('Copied!'),
        content: const Text('Your message has been copied to clipboard'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]);
  }
}
