import 'package:flutter/material.dart';

class Button extends StatelessWidget {
   Button({super.key, required this.onTap, required this.text});

  final String text;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: Colors.blue[500], borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {onTap();},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: double.maxFinite,
          child:  Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
