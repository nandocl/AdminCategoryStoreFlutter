import 'package:flutter/material.dart';

class Boton extends StatelessWidget {

  Boton({this.btnText, this.onTap, this.bgColor, this.textColor});
  final Function onTap;
  final String btnText;
  final Color bgColor;
  final Color textColor;


  @override
  Widget build(BuildContext context) {  
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(bgColor)),
      onPressed: onTap,
      child: Text(btnText,
              style:TextStyle(
                color: textColor)
            )
    );
  }
}