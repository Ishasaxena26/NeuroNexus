import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/questions.dart';
import 'package:flutter_application_3/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

//Map is a collection of key value pairs
//Object is a flexible type that can store anything
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      final String questionText = questions[i].text;
      final String correctAnswer = questions[i].answers.isNotEmpty
          ? questions[i].answers[0]
          : 'No correct answer';
      final String userAnswer = chosenAnswers[i];
      summary.add(
        {
          'question_index': i,
          'question': questionText,
          'correct_answer': correctAnswer,
          'user_answer': userAnswer,
        },
      ); //adding map
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] ==
          data['correct_answer']; //returns true or false
    }).length; //where is used to filter the list

    return SizedBox(
      width:
          double.infinity, //take as much width as u can ....takes entire width
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answerd $numCorrectQuestions out of $numTotalQuestions correctly ',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 235, 197, 197),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
