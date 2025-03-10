import 'package:flutter/material.dart';
import '../constants.dart';
        

class IconContent extends StatelessWidget {

  IconContent({this.icon, this.label = ''});
  
  IconData? icon; 
  String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
        size : 80),
        SizedBox(height: 15,),
        Text(label, 
        style: kLabelStyle
        )
      ]);
  }
}