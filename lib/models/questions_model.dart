import 'dart:convert';

QuestionsModel questionsModelFromJson(String str) =>
    QuestionsModel.fromJson(json.decode(str));

String questionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

class QuestionsModel {
  QuestionsModel({
    this.category,
    this.type,
    this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  String? category;
  String? type;
  String? difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers:
            List<String>.from(json["incorrect_answers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
        "difficulty": difficulty,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };
}
