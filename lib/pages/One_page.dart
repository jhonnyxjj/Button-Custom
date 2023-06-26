import 'dart:math';

import 'package:flutter/material.dart';
import '../widget/custom_button-widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});
  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);

  random() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      valorAleatorio.value = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valorAleatorio,
              builder: (_, value, __) => Text(
                'valor eh: $value',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            CustomButtonWidget(
              disable: false,
              onPressed: () => random(),
              title: 'Button Custom',
              titleSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
