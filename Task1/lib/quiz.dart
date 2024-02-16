import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/questions.dart';
import 'package:flutter_application_3/questions_screen.dart';
import 'package:flutter_application_3/result_screen.dart';
import 'package:flutter_application_3/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
//Method 1 fore rendering screens:
/*  Widget? activeScreen;//must receive some data 
  @override
  void initState() {
    activeScreen = StartScreen(
        switchScreen); //passing a pointer to the switchScreen function
    super.initState();
  }
  
  void switchScreen() {
    //setState re-executes the build method below
    setState(() {
      activeScreen = const QuestionsScreen();
      print("screen changed");
    });
  }
*/

//Method2 for rendering:
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  List<String> selectedAnswers =
      []; //stores the answers which the user has selected

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
        switchScreen); //passing function in the constructor of SwitchScreen Class

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswers,
        selectedAnswers: selectedAnswers,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 46, 7, 113),
                Color.fromARGB(255, 95, 46, 181)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //via Method 1: child: activeScreen,
          //via Method2:
          child: screenWidget,
        ),
      ),
    );
  }
}
