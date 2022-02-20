import 'package:bmi_caculator/constains.dart';
import 'package:bmi_caculator/widget/input_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.result,
      required this.interpretation,
      required this.score})
      : super(key: key);

  final String result;
  final String interpretation;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result page'),
        leading: const SizedBox(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              'YOUR RESULT',
              style: kBigText,
            ),
          ),
          Expanded(
            child: InputCard(
                child: Container(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        result,
                        style: (result.contains('Overweight') ||
                                result.contains('Underweight'))
                            ? kHighlightText.copyWith(color: Colors.red)
                            : kHighlightText,
                      ),
                      Text(
                        score,
                        style: kBigText.copyWith(fontSize: 100),
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kLabelText,
                      ),
                    ],
                  ),
                ),
                voidCallBack: null,
                widgetColor: Colors.white12),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            fillColor: Colors.blueGrey,
            elevation: 0,
            shape: const RoundedRectangleBorder(),
            constraints:
                const BoxConstraints(minHeight: 80, minWidth: double.infinity),
            child: const Text(
              'RE-CACULATE',
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
