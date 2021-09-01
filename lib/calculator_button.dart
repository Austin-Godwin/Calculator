import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String? text;
  final int textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? color;
  final Color? fillColor;
  final Function? callback;
  const CalculatorButton(
      {Key? key,
      this.text,
      this.textColor = 0xFFFFFF,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.fillColor,
      this.callback})
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
            callback!(text);
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
