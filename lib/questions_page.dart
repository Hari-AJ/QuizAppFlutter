import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class Questions extends StatefulWidget {
  const Questions(this.storeAns,{Key? key}) : super(key: key);
  final void Function(String ans) storeAns;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var qnp = 0;

  void ansButtonTap(String ans){
    widget.storeAns(ans);
    setState(() {
      qnp++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[qnp];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign:TextAlign.center ,
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffleAns().map(
                  (e) => AnswerButton(e, ansButtonTap),
                ),
          ],
        ),
      ),
    );
  }
}
