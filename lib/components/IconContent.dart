import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.gender,this.symbol });
  final String gender;
  final IconData symbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(symbol, size: 80.0,),
        SizedBox(height: 15.0,),
        Text(gender, style:klabelTextStyle ),
      ],
    );
  }
}