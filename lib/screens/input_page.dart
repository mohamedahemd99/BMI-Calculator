import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/IconContent.dart';
import '../components/ReusableCard.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

enum Gender{
  male,
  female,

}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();

}

class _InputPageState extends State<InputPage> {
  int height=180;
  Gender selectgender;
  int weight=60;
  int age=21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectgender=Gender.male;
                      });
                    },
                    colour: selectgender==Gender.male?kactiveColor:kinactiveColor,
                    cardChild: IconContent(gender: "MALE" , symbol: FontAwesomeIcons.mars,),
                  ),

                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectgender=Gender.female;
                      });
                    },
                    colour: selectgender==Gender.female?kactiveColor:kinactiveColor,
                    cardChild: IconContent(gender: "FEMALE" , symbol: FontAwesomeIcons.venus,),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour:
            kactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                          style: kheightTextStyle,
                      ),
                      Text(
                        "CM",
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor:Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)

                    ),

                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      },

                    ),
                  )
                ],
              ),
            ),

          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactiveColor,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kheightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPress: (){
                              setState(() {
                                weight--;
                              });
                              },
                            ),

                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPress: (){
                              setState(() {
                                weight++;
                              });
                              },
                            ),
                          ],
                        )
                      ],
                    ) ,
                  ),
                ),
                Expanded(child: ReusableCard(
                  colour: kactiveColor,
                  cardChild:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: klabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kheightTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),

                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPress: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ) ,
                ),
                ),
              ],
            ),
          ),
          BottomButton(onTap: (){
            CalculatorBrain calc= CalculatorBrain(height: height,weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>ResultsPage(
                  bmiresult:calc.calculateBMI() ,
                  interpretation:calc.getInterpretation(),
                  resulttext: calc.getResult(),
                ),
              ),
            );
          },buttonTitle: "CALCULATE",)
        ],
      )
    );
  }
}




class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,this.onPress});
  final Function onPress;
  final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress ,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}





