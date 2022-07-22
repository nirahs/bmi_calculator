import 'package:bmi_calculator/constantes.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  RoundIconButton({required this.icon, this.onPressed, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      shape: CircleBorder(),
      fillColor: kRoundedIconButton,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: icon,
    );
  }
}
