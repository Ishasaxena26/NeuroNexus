//THIS FILE CONTAINS basically the model

class QuizQuestion {
  const QuizQuestion(this.text,
      this.answers); //constructor to create different quiz question objects with different texts and answers

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); //copies an existing list
    shuffledList.shuffle();
    return shuffledList;
  }
}
