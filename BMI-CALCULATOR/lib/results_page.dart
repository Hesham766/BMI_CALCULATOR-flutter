import 'package:bmi_calc/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Resultpage extends StatelessWidget {
  const Resultpage(
      {super.key,
      required this.resultText,
      required this.bmiResult,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: titleText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GenderCard(
              colour: inactivecolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: resultTextstyle,
                  ),
                  Text(
                    bmiResult,
                    style: bmiText,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: bodyText,
                    ),
                  )
                ],
              ),
              color: activecolor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: bottomcontainercolor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomcontainerheight,
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: largebuttontext,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
