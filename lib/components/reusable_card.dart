import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  /*
    -- const --
      - cannot reassign
      - const must be create from data that can be calculated at compile time.
        - const number = (2*2)/3 is valid 
        - But const number = DateTime().now() doesn't work because it need to computed at runtime
        - const color = Color.toString() doesn't work because it doesn't assigned at compile time

    -- final --
      - final can be created from data that can be calculated at any time.
      - cannot reassign
  */

  final Color color;
  final Widget? cardChild; // optional
  final VoidCallback? onSelect;

  ReusableCard({this.cardChild, this.onSelect, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Doesn't change any style or width and height of child
      onTap: onSelect,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: this.cardChild,
      ),
    );
  }
}

// child: GestureDetector(
//   // Doesn't change any style or width and height
//   onTap: () => setState(() {
//     selectedGender = GenderType.male;
//   }),
