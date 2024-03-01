import 'package:flutter/material.dart';
import 'package:second_project/data/questions.dart';
import 'package:second_project/question.dart';
import 'package:second_project/start_screen.dart';
import 'package:second_project/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activePress;
  // @override
  // void initState() {
  //   super.initState();
  //   activePress = Starts(switchScreen);
  // }

  List<String> selectedAnswers = [];
  var activePress = 'start_screen';

  void switchScreen() {
    setState(() {
      activePress = 'question';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activePress = 'result_screen';
      });
    }
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers.length = 0;
      activePress = 'questions';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = Starts(switchScreen);
    if (activePress == 'question') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activePress == 'result_screen') {
      screenWidget =
          ResultScreen(chosenAnswer: selectedAnswers, resetQuiz: resetQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 144, 190, 16),
              Color.fromARGB(255, 201, 132, 132),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
