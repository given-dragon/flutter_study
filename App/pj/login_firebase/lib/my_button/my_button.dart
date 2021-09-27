// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  MyButton(
      {required this.image,
      required this.text,
      required this.color,
      required this.radius,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //버튼 내의 여백을 모두 같게 설정
        children: <Widget>[
          image,
          text,
          Opacity(
            //투명도 조절 가능한 위젯
            opacity: 0.0,
            child: image,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size.fromHeight(50.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
      ),
      onPressed: onPressed,
    );
  }
}
