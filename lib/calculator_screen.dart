import 'package:flutter/material.dart';
import 'package:calculator/calculator_button.dart';

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
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';
  final calButton = CalculatorButton();

  void charClick(String text) {
    if (text == '÷' || text == '×' || text == '−' || text == '+') {
      num1 = double.parse(_expression);
      operand = text;
    } else if (text == '=') {
      num2 = double.parse(_expression);
      if (text == '+') {
        _expression = (num1 + num2).toString();
        print(_expression);
      }
    }
    setState(() {
      _expression += text;
      _expression = double.parse(_expression).toString();
      // print(_expression);
      // if (text == '÷' || text == '×' || text == '−' || text == '+') {
      //
      // }
    });
  }

  void allClear(String text) {
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                    top: 30,
                    bottom: 20,
                  ),
                  child: Container(
                    child: Text(
                      _expression,
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
                    alignment: Alignment(1, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                    top: 30,
                    bottom: 20,
                  ),
                  child: Container(
                    child: Text(
                      _history,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white10,
                          fontWeight: FontWeight.w200),
                    ),
                    alignment: Alignment(1, 1),
                  ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: 'C',
                          fillColor: Colors.white10,
                          textColor: 0xFFFF7043,
                          fontSize: 35.0,
                          callback: allClear,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '( )',
                          fillColor: Colors.white10,
                          textColor: 0xFF9CCC65,
                          fontSize: 30.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '%',
                          fillColor: Colors.white10,
                          textColor: 0xFF9CCC65,
                          fontSize: 35.0,
                          fontWeight: FontWeight.normal,
                          callback: charClick,
                        ),
                        CalculatorButton(
                          text: '÷',
                          fillColor: Colors.white10,
                          textColor: 0xFF9CCC65,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w300,
                          callback: charClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '7',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '8',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '9',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '×',
                          fillColor: Colors.white10,
                          textColor: 0xFF9CCC65,
                          fontSize: 50.0,
                          callback: charClick,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '4',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '5',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '6',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '−',
                          fillColor: Colors.white10,
                          textColor: 0xFF9CCC65,
                          fontSize: 50.0,
                          callback: charClick,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '1',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '2',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '3',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '+',
                          fillColor: Colors.white10,
                          textColor: 0xFF9CCC65,
                          fontSize: 50.0,
                          callback: charClick,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '+/−',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 30.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '0',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '.',
                          fillColor: Colors.white10,
                          textColor: 0xFFFFFFFF,
                          fontSize: 35.0,
                          callback: charClick,
                          fontWeight: FontWeight.normal,
                        ),
                        CalculatorButton(
                          text: '=',
                          fillColor: Colors.lightGreen[900],
                          textColor: 0xFFFFFFFF,
                          fontSize: 50.0,
                          callback: charClick,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    )
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
