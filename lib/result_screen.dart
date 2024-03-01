import 'package:flutter/material.dart';
import 'package:second_project/data/questions.dart';
import 'package:second_project/result_summary.dart';

class ResultScreen extends StatelessWidget {
  final void Function() resetQuiz;
  const ResultScreen({
    required this.resetQuiz,
    super.key,
    required this.chosenAnswer,
  });

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'chosen_answer': chosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answer $correctQuestions out of $totalQuestions Correctly ',
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            ResultSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: resetQuiz,
              child: const Text('Reset Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
