import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/quiz_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.chosenAns, this.changeScreen, {Key? key})
      : super(key: key);
  final List<String> chosenAns;
  final void Function() changeScreen;
  final List<QuizQuestion> qns = questions;
  var correctAns = 0;

  List<Map<String, Object>> getQuizSummary() {
    List<Map<String, Object>> quizSummary = [];
    for (var i = 0; i < chosenAns.length; i++) {
      quizSummary.add(
        {
          'questionNo': i + 1,
          'question': questions[i].question,
          'ans': questions[i].answers[0],
          'selectedAns': chosenAns[i],
        },
      );
    }
    return quizSummary;
  }

  int crtAns(List<Map<String, Object>> quizSummary) {
    int val = 0;
    for (var i in quizSummary) {
      if (i['selectedAns'] == i['ans']) {
        val++;
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> quizSummary = getQuizSummary();
    final int val = crtAns(quizSummary);
    final int total = quizSummary.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $val questions out of $total correctly",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(),
            ),
            const SizedBox(height: 30),
            QuizSummary(quizSummary),
            const SizedBox(height: 30),
            TextButton.icon(
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed:changeScreen,
                label: const Text(
                  "Restart Quiz!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
    ;
  }
}
