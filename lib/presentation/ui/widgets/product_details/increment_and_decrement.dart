import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/custom_steper.dart';
import 'package:flutter/material.dart';

class IncrementAndDecrement extends StatefulWidget{
  const IncrementAndDecrement({super.key});
  @override
  State<IncrementAndDecrement> createState() => _IncrementAndDecrement();
}
class _IncrementAndDecrement extends State<IncrementAndDecrement>{



  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      const Text('Addidas shoe HK23454 - Black Edition',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5)),
      CustomStepper(
        lowerLimit: 1,
        upperLimit: 10,
        stepValue: 1,
        value: 1,
        onChange: (newValue) {
          print(newValue);
        },
      ),
    ]);
  }
  }