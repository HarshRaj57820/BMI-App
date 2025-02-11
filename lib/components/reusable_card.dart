import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  Color? colour;
  Widget? cardChild;
  Function()? onPress = (){};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild ,
       margin: EdgeInsets.all(10),
       decoration: BoxDecoration(
        color: colour,
         borderRadius: BorderRadius.circular(10),
       ),
       ),
    );
  }
}