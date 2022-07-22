import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constantes.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final CalculatorBrain bmi;

  ResultsPage({required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 35, left: 15),
              child: Text(
                "Your Result",
                style: kResultHeadTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmi.getResult(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi.calculateBMI(),
                    style: kResultLargeNumberTextStyle,
                  ),
                  Text(
                    bmi.getTip(),
                    textAlign: TextAlign.center,
                    style: kResultBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            content: "Re-Calculate",
            onTap: () => {
              Navigator.pop(context),
            },
          ),
        ],
      ),
    );
  }
}
