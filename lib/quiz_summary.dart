import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSummary extends StatelessWidget {
  QuizSummary(this.quizSummary, {Key? key}) : super(key: key);
  List<Map<String, Object>> quizSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: quizSummary
              .map((data) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: data['selectedAns'] == data['ans']
                              ? Colors.green
                              : Colors.red,
                        ),
                        child: Text(
                          data['questionNo'].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'].toString(),
                              style: GoogleFonts.lato(
                                color: Colors.white60,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              data['selectedAns'].toString(),
                              style: GoogleFonts.actor(
                                color: Colors.lightGreen,
                              ),
                            ),
                            Text(data['ans'].toString(),
                            style: GoogleFonts.actor(
                              color:Colors.lightGreenAccent
                            ),),
                            const SizedBox(height: 10,),

                          ],
                        ),
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
