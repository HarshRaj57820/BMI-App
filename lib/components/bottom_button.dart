import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.bottomButtonText = '', @required this.onTap});

  String bottomButtonText;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            bottomButtonText,
          textAlign: TextAlign.center,
        
            style: kBottomContainerTextStyle,
          ),
        ),
        
      ),
    );
  }
}
