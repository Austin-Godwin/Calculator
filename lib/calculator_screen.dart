import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calculator/calculator_button.dart';

const Operators = ['+', '-', '*', '÷'];
const Buttons = [
  'C',
  '()',
  '%',
  '÷',
  1,
  2,
  3,
  '*',
  4,
  5,
  6,
  '-',
  7,
  8,
  9,
  '+',
  '+/−',
  0,
  '.',
  '='
];

class CalcScreen extends StatefulWidget {
  static final route = "homePage";
  CalcScreen();

  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  // String expression = '';

  String _history = '';
  String _expression = '';
  String num1 = '';
  String defaultVal = '';
  String result = '';
  String operand = '';
  final calButton = CalculatorButton(
    callback: (String text, ButtonTypes type) {},
  );

  void charClick(String text, ButtonTypes type) {
    setState(() {
      if (type == ButtonTypes.number) {
        num1 += text;
      } else if (type == ButtonTypes.operators) {
        operand = text;
        defaultVal = num1;
        num1 = '';
      } else if (text == '=') {
        if (operand == '+') {
          num1 = (double.parse(defaultVal) + double.parse(num1)).toString();

          print(_expression);
        } else if (operand == '-') {
          num1 = (double.parse(defaultVal) - double.parse(num1)).toString();
        }
      }

      if (text == "C") {
        num1 = "";
        defaultVal = "";
        _expression = "";
      }
      if (text != "=" || text != "C") {
        _expression += text;
      }
      // _expression = double.parse(_expression).toString();
      // print(_expression);
      // if (text == '÷' || text == '×' || text == '−' || text == '+') {
      //
      // }
    });
  }

  void allClear(String text, ButtonTypes type) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String? text) {
    setState(() {
      if (_expression != '' && _expression.length > 0) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  ButtonTypes getButtonType(dynamic text) {
    if (text.runtimeType == int || text.runtimeType == double)
      return ButtonTypes.number;

    if (text == '.') return ButtonTypes.dot;

    if (Operators.contains(text)) return ButtonTypes.operators;

    return ButtonTypes.specialChar;
  }

  int getColor(String text) {
    if (text == 'C') return Colors.red.value;
    if (text == '()') return Colors.green.value;

    return 0xFFFFFFFF;
  }

  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
              right: 0.0,
              top: 30,
              bottom: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                    top: 30,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      Text(
                        num1,
                        // maxLines: 2,
                        // decoration: InputDecoration(border: InputBorder.none),
                        // showCursor: true,
                        // cursorColor: Colors.teal[200],
                        // readOnly: true,
                        textAlign: TextAlign.right,
                        // onChanged: (text) {
                        //
                        // },
                        style: TextStyle(
                            fontSize: 45.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        _expression,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  alignment: Alignment(1, 1),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 0.0,
                      right: 35.0,
                      top: 0.0,
                      bottom: 0.0,
                    ),
                    child: IconButton(
                      splashRadius: 1.0,
                      icon: Icon(Icons.backspace_outlined),
                      iconSize: 20.0,
                      color: Colors.lightGreen[800],
                      onPressed: () {
                        clear(calButton.text);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 0.0,
                      bottom: 0.0,
                    ),
                    child: Divider(
                      color: Colors.white30,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 15,
                      runAlignment: WrapAlignment.spaceEvenly,
                      alignment: WrapAlignment.spaceEvenly,
                      children: Buttons.map((e) => CalculatorButton(
                            type: getButtonType(e),
                            text: '$e',
                            fillColor: Colors.white10,
                            textColor: getColor('$e'),
                            fontSize: 35.0,
                            callback: charClick,
                            fontWeight: FontWeight.normal,
                          )).toList(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
