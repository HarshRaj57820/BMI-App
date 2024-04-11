import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_calculations.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult = '', @required this.resultText = '', @required this.interpretation = ''
  });
  
  String bmiResult;
  String resultText;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text("Your Result",
            style: kTitleTextStyle,
            textAlign: TextAlign.left,
          
                  
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: ReusableCard(colour: kActiveCardColor,
            cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: ,
            children: [
            Text(resultText.toUpperCase(),
          style: kResultTextStyle,
          ),
          Text(bmiResult,
          style: kBMITextStyle,),
          Text(interpretation,
          style: kBodyTextStyle,
          textAlign: TextAlign.center,),
          ]),),
        ),
        
        BottomButton(bottomButtonText: "RE-CALCULATE", onTap: (){
            Navigator.pop(context);
        })
      ]),
    );
  }
}