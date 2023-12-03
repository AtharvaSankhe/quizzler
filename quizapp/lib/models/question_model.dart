// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

List<Question> questionFromJson(String str) => List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  int id;
  String questionTitle;
  String option1;
  String option2;
  String option3;
  String option4;
  String rightAnswer;
  String? difficultylevel;
  String? category;

  Question({
    required this.id,
    required this.questionTitle,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.rightAnswer,
    required this.difficultylevel,
    required this.category,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    questionTitle: json["questionTitle"],
    option1: json["option1"],
    option2: json["option2"],
    option3: json["option3"],
    option4: json["option4"],
    rightAnswer: json["rightAnswer"],
    difficultylevel: json["difficultylevel"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "questionTitle": questionTitle,
    "option1": option1,
    "option2": option2,
    "option3": option3,
    "option4": option4,
    "rightAnswer": rightAnswer,
    "difficultylevel": difficultylevel,
    "category": category,
  };
}
