import 'package:bmi_calculator/constantes.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData icon;

  IconContent({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: 90.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          this.label,
          style: TextStyle(
            fontSize: kLabelTextStyle.fontSize,
            color: kLabelTextStyle.color,
          ),
        )
      ],
    );
  }
}
