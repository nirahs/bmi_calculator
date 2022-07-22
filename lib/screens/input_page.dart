import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constantes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderType { male, female, none }

class InputPage extends StatefulWidget {
  @override
  _InputPage createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  GenderType selectedGender = GenderType.none;
  int selectedHeight = 180;
  int selectedWeight = 100;
  int selectedAge = 18;

  @override
  Widget build(context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onSelect: () {
                      print('[TEST] - Gesture is working in male section');
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    cardChild: IconContent(
                      label: kMaleCardContent,
                      icon: kMaleIcon,
                    ),
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onSelect: () {
                      print('[TEST] - Gesture is working in female section');
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    cardChild: IconContent(
                      label: kFemaleCardContent,
                      icon: kFemaleIcon,
                    ),
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline, // new idea
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$selectedHeight',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  // Indivualy change design
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1.5,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kInActiveSlideColor,
                      thumbColor: kActiveSlideColor,
                      overlayColor: kOverlayColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                      value: selectedHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          selectedHeight = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Weight",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          "$selectedWeight",
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  selectedWeight > 1
                                      ? selectedWeight--
                                      : selectedWeight = 100;
                                })
                              },
                              icon: Icon(
                                FontAwesomeIcons.minus,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.plus),
                              onPressed: () => {
                                setState(() {
                                  selectedWeight++;
                                })
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          "$selectedAge",
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPressed: () => {
                                setState(() {
                                  selectedAge > 1
                                      ? selectedAge--
                                      : selectedAge = 18;
                                })
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.plus),
                              onPressed: () => {
                                setState(() {
                                  selectedAge++;
                                })
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            content: "Calculate",
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi:  CalculatorBrain(height: selectedHeight, weight: selectedWeight),
                  ),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }

  void selectedCard(GenderType gender) {}
}
