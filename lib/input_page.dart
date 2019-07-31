import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 75.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  var maleCardColour = inactiveCardColour;
  var femaleCardColour = inactiveCardColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColour(1);
                      });
                    },
                    child: ReusableCard(
                      color: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColour(2);
                      });
                    },
                    child: ReusableCard(
                      color: femaleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(color: activeCardColour),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(color: activeCardColour),
                ),
                Expanded(
                  child: ReusableCard(color: activeCardColour),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }

  void changeColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    } else if (gender == 2) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }
}
