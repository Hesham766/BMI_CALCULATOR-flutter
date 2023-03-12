import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool male = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        male = true;
                      });
                    },
                    child: GenderCard(
                      colour: (male) ? activecolor : inactivecolor,
                      cardchild: const Cardcontent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      color: const Color(0xff23282e),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        male = false;
                      });
                    },
                    child: GenderCard(
                      colour: (male) ? inactivecolor : activecolor,
                      cardchild: const Cardcontent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      color: const Color(0xff23282e),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color(0xff23282e),
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: labelTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: cardTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xff0d00bb),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 13.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: const Color(0xff0d00bb),
                        inactiveColor: const Color(0xff8d8b98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    colour: inactivecolor,
                    color: inactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WIGHT',
                          style: labelTextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: cardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    colour: inactivecolor,
                    color: inactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: labelTextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: cardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
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
              Calculator calc = Calculator(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultpage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getresult(),
                    interpretation: calc.getinterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: bottomcontainercolor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomcontainerheight,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: largebuttontext,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int height = 180;
  int weight = 60;
  int age = 20;
}

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.colour,
      required this.cardchild,
      required Color color});

  final Color colour;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: cardchild,
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 8.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xff0d00bb),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
