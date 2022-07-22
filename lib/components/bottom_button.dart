import 'package:bmi_calculator/constantes.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String content;
  final VoidCallback onTap;

  BottomButton({required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
