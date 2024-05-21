import 'package:bonus_app_admin/exports.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  ConfirmDialog(
      {super.key,
      required this.title,
      required this.text,
      required this.onTap});
  final String title;
  final String text;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              onTap();
              Get.back();
            },
            child: const Text(
              "Tasdiqlash",
              style: TextStyle(color: Colors.green, fontSize: 16),
            )),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Bekor qilish",
              style: TextStyle(color: Colors.red, fontSize: 16),
            )),
      ],
      content: SingleChildScrollView(
          child: ListBody(
        children: [
          Text(text),
        ],
      )),
    );
  }
}
