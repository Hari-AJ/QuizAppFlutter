import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.ans,this.onPressed, {Key? key}) : super(key: key);
  final String ans;
  final void Function(String ans) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:(){
          onPressed(ans);
        },
        style:ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),

        ) ,
        child: Text(ans,
          textAlign: TextAlign.center,
          style:GoogleFonts.lato(
          ),
        ));
  }
}
