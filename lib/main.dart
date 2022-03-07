import 'package:bmi_caculator/provider/bmi_caculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Caculator',
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider(
        create: (_) => BmiCaculatorProvider(),
        builder: (context, child) {
          return const InputPage();
        },
      ),
    );
  }
}
