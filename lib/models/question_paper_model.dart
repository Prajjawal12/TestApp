import 'dart:convert';

class Answer {
  final String? identifier;
  final String? answer;

  Answer({this.identifier, this.answer});

  Answer.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['Answer'] = this.answer;
    return data;
  }
}

class QuestionPaperModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['Description'],
        timeSeconds = json['time_seconds'],
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['Description'] = this.description;
    data['time_seconds'] = this.timeSeconds;
    data['questions'] = this.questions!.map((q) => q.toJson()).toList();
    return data;
  }

  static QuestionPaperModel fromJSON(Map<String, dynamic> json) {
    return QuestionPaperModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
      description: json['Description'],
      timeSeconds: json['time_seconds'],
      questions: (json['questions'] as List)
          .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Questions {
  String id;
  String question;
  List<Answer> answers;
  String? correctAnswer;

  Questions(
      {required this.id,
      required this.question,
      required this.answers,
      required this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answer.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answers'] = this.answers.map((a) => a.toJson()).toList();
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

void main() {
  String jsonString = '''
  {
    "id": "1",
    "title": "Sample Question Paper",
    "image_url": "https://example.com/image.png",
    "Description": "This is a sample question paper",
    "time_seconds": 3600,
    "questions": [
      {
        "id": "q1",
        "question": "What is the capital of France?",
        "answers": [
          {"identifier": "a", "Answer": "Paris"},
          {"identifier": "b", "Answer": "Rome"},
          {"identifier": "c", "Answer": "Berlin"},
          {"identifier": "d", "Answer": "Madrid"}
        ],
        "correct_answer": "a"
      },
      {
        "id": "q2",
        "question": "What is 2 + 2?",
        "answers": [
          {"identifier": "a", "Answer": "3"},
          {"identifier": "b", "Answer": "4"},
          {"identifier": "c", "Answer": "5"},
          {"identifier": "d", "Answer": "6"}
        ],
        "correct_answer": "b"
      }
    ]
  }
  ''';

  Map<String, dynamic> jsonData = jsonDecode(jsonString);
  QuestionPaperModel paper = QuestionPaperModel.fromJSON(jsonData);

  print(paper.toJson());
}
