import 'package:flutter/material.dart';
import 'package:quiz_app/questions_page.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAns = [];


  void restartQuiz(){
    setState(() {
      selectedAns=[];
      activeScreen = Questions(storeAns);
    });

  }
  void storeAns(String ans) {
    selectedAns.add(ans);
    if (selectedAns.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAns, restartQuiz);
        selectedAns = [];
      });
    }
  }

  void changeScreen() {
    setState(() {
      activeScreen = Questions(storeAns);
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    activeScreen = StartScreen(changeScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
