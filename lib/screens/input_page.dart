import 'package:bmi_calculator/bmi_calculations.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/bmi_calculations.dart';

// Created Enum (Enumeration) for gender instead of number
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int age = 19;
  int weight = 60;
  int height = 180;
  Gender? selectedGender;

  // Used this work using ternary operators !
  // Color maleCardColor = kInActiveCardColor;
  // Color femaleCardColor = kInActiveCardColor;

  // void updateCardColor(Gender selectedGender){
  //   if (selectedGender == Gender.male){
  //     if (maleCardColor == kInActiveCardColor ){
  //       maleCardColor = kActiveCardColor;
  //       femaleCardColor = kInActiveCardColor;
  //     }
  //     else{
  //       maleCardColor = kInActiveCardColor;
  //     }
  //   }

  //   if (selectedGender == Gender.female){
  //     if (femaleCardColor == kInActiveCardColor ){
  //       femaleCardColor = kActiveCardColor;
  //       maleCardColor = kInActiveCardColor;
  //     }
  //     else{
  //       femaleCardColor = kInActiveCardColor;
  //     }
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Height",
                  style: kLabelStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                    Text(height.toString(),
                    style: kNumberStyle,
                    ),
                    Text("cm",
                    style: kLabelStyle,),
                    
                
                  ],),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),

                    

                    
                    child: Slider(
                        min: 120,
                        max: 250,
                        activeColor: Colors.white,
                        thumbColor: kBottomContainerColor,
                        // overlayColor: Color(0x29EB1555),
                        value: height.toDouble(),
                        onChanged: (double newValue){
                          setState(() {
                            // Converts double to int
                            height = newValue.round();
                          });
                              
                        }
                        ),
                  )
            
                ]),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight",
                        style: kLabelStyle,),
                        Text(weight.toString(),
                        style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                          ],
                        ),
                        
                      ],
                    ),
                  )),
                  Expanded(child: ReusableCard(colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age",
                        style: kLabelStyle,),
                        Text(age.toString(),
                        style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),),
                ],
              ),
            ),
            BottomButton(bottomButtonText: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height, weight);
            
        Navigator.push(context, MaterialPageRoute(builder: (context){
           return ResultsPage(
            bmiResult : calc.calculateBMI(),
            resultText : calc.getResult(),
            interpretation: calc.getInterpretation()
          
          
        ); }));
      },
            )
          ],
        ));
  }
}




