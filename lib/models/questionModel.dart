class Question {
  String question;
  List<String> options;
  String type;

  Question({required this.question, required this.type, required this.options});
}

enum QuestionType { text, dropdown, multipleChoice }
