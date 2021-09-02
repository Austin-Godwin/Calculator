import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

enum ButtonTypes { number, operators, dot, specialChar }

typedef BtnCallBack = void Function(String text, ButtonTypes type);

class CalculatorButton extends StatelessWidget {
  final String? text;
  final ButtonTypes type;
  final int textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? color;
  final Color? fillColor;
  final BtnCallBack callback;
  const CalculatorButton(
      {Key? key,
      this.text,
      this.textColor = 0xFFFFFF,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.fillColor,
      this.type = ButtonTypes.number,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: SizedBox(
        width: 75,
        height: 75,
        child: ElevatedButton(
          onPressed: () {
            callback(text ?? '', type);
          },
          child: Text(
            text!,
            style: TextStyle(color: Color(textColor)),
            // style: GoogleFonts.rubik(
            //     textStyle: TextStyle(color: Color(textColor))),
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: Colors.white12)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(fillColor!),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: fontSize, fontWeight: fontWeight),
            ),
          ),
        ),
      ),
    );
  }
}
