import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_cal/constants.dart';
import 'package:bmi_cal/icon_content.dart';
import 'package:bmi_cal/reusable_card.dart';
import 'package:bmi_cal/calculator_brain.dart';
import 'package:bmi_cal/result.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weigh = 60;
  int age = 19;

  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  void updateColour(int gender) {
    setState(() {
      if (gender == 1) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
        femaleCardColour = activeCardColour;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /// Gender
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => updateColour(1),
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => updateColour(2),
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      Text('cm', style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 13,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 25,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: labelTextStyle),
                        Text(weigh.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weight-',
                              mini: true,
                              backgroundColor: const Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  if (weigh > 1) weigh--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 10),
                            FloatingActionButton(
                              heroTag: 'weight+',
                              mini: true,
                              backgroundColor: const Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weigh++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: labelTextStyle),
                        Text(age.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age-',
                              mini: true,
                              backgroundColor: const Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 10),
                            FloatingActionButton(
                              heroTag: 'age+',
                              mini: true,
                              backgroundColor: const Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weigh,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
              color: const Color(0xFFEB1555),
              alignment: Alignment.center,
              child: const Text(
                'CALCULATE BMI',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
