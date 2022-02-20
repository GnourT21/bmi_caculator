import 'package:bmi_caculator/bmi_caculator.dart';
import 'package:bmi_caculator/constains.dart';
import 'package:bmi_caculator/pages/result_page.dart';
import 'package:bmi_caculator/widget/custom_round_btn.dart';
import 'package:bmi_caculator/widget/input_card.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  double height = 170;
  double weight = 40;
  int age = 14;
  void increasement() {
    setState(() {
      weight++;
    });
  }

  void decreasement() {
    setState(() {
      weight--;
    });
  }

  void ageIncreasement() {
    setState(() {
      age++;
    });
  }

  void ageDecreasement() {
    setState(() {
      age--;
    });
  }

  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Caculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InputCard(
                    voidCallBack: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    widgetColor: selectedGender == Gender.male
                        ? Colors.white12
                        : Colors.white38,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.male,
                          size: 80,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InputCard(
                    widgetColor: selectedGender == Gender.female
                        ? Colors.white12
                        : Colors.white38,
                    voidCallBack: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.female,
                          size: 80,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InputCard(
              widgetColor: Colors.white38,
              voidCallBack: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelText,
                  ),
                  RichText(
                    text: TextSpan(
                      text: height.toStringAsFixed(0),
                      style: kBigText,
                      children: const [
                        TextSpan(
                          text: ' CM',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.blueAccent,
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InputCard(
                    widgetColor: Colors.white38,
                    voidCallBack: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kBigText,
                            ),
                            const Text(
                              ' KG',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundedButton(
                              shape: const CircleBorder(),
                              width: 46,
                              height: 46,
                              icon: Icons.remove,
                              onpress: decreasement,
                            ),
                            const SizedBox(
                              width: 14.0,
                            ),
                            MyRoundedButton(
                              shape: const CircleBorder(),
                              width: 46,
                              height: 46,
                              icon: Icons.add,
                              onpress: increasement,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InputCard(
                    widgetColor: Colors.white38,
                    voidCallBack: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelText,
                        ),
                        Text(
                          age.toString(),
                          style: kBigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundedButton(
                              shape: const CircleBorder(),
                              width: 46,
                              height: 46,
                              icon: Icons.remove,
                              onpress: ageDecreasement,
                            ),
                            const SizedBox(
                              width: 14.0,
                            ),
                            MyRoundedButton(
                              shape: const CircleBorder(),
                              width: 46,
                              height: 46,
                              icon: Icons.add,
                              onpress: ageIncreasement,
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
          RawMaterialButton(
            onPressed: () {
              BmiCaculator bmi = BmiCaculator(height: height, weight: weight);
              bmi.caculatorBMI();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: bmi.getResult(),
                    score: bmi.caculatorBMI(),
                    interpretation: bmi.getInterpretation(),
                  ),
                ),
              );
            },
            fillColor: Colors.blueGrey,
            elevation: 0,
            shape: const RoundedRectangleBorder(),
            constraints:
                const BoxConstraints(minHeight: 80, minWidth: double.infinity),
            child: const Text(
              'CACULATE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
