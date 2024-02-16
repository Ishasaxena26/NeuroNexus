import 'package:flutter/material.dart';
import 'package:flutter_application_3/answer_button.dart';
import 'package:flutter_application_3/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.selectedAnswers,
  });

  final void Function(String answer) onSelectAnswer;
  final List<String> selectedAnswers;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  var showFeedback = false;

  // void answerQuestion(String selectedanswer) {
  //   widget.onSelectAnswer(
  //       selectedanswer); //onSelectAnswer upar wali class me hai to usko is class me access krne k liye 'widget.'yeh use kiya hai
  //   setState(() {
  //     currentQuestionIndex++;
  //   });
  // }
  void answerQuestion(String selectedanswer) {
    widget.onSelectAnswer(selectedanswer);
    setState(() {
      showFeedback = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showFeedback = false;
        currentQuestionIndex++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width:
          double.infinity, //take as much width as u can ....takes entire width
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(currentQuestion.text,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(height: 40),
            if (showFeedback)
              Text(
                "Your answer: ${widget.selectedAnswers.last}",
                style: TextStyle(
                  color:
                      widget.selectedAnswers.last == currentQuestion.answers[0]
                          ? Colors.green
                          : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

            //generating answers dynamically:
            //the map method converts list into another type of values(in this case -Widgets)
            //the func inside map works on every item stored in that list
            //map yields a new list in memory and does not affect the old one
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }), //yahan list k ander list banri as upar children property k ander h to list k ande list banri to uske liye spread operator(...) use kiya hai .
            //isse aesa banra[[]] toh []ander wali list bahar aajayegi

            //Hardcoded these answers rather than dynamically generating them
            // AnswerButton(
            //   answerText: currentQuestion.answers[0],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[1],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[2],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
