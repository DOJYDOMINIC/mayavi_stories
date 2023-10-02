import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Bubbles extends StatelessWidget {
  const Bubbles({Key? key, required this.onTap, required this.text, this.topleft, required this.bottomleft, this.topright, required this.bottomright, required this.width}) : super(key: key);

  final VoidCallback onTap;
  final double? topleft;
  final double bottomleft;
  final double? topright;
  final double bottomright;
  // final double height;
  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(Icons.volume_up),
          Container(
            // height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(bottomright),
                bottomLeft: Radius.circular(bottomleft),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              border: Border.all(width: 2, color: Colors.black),
            ),
            child: Center(child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(text).tr(),
            )),
          ),
        ],
      ),
    );
  }
}
