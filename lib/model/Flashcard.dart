import 'package:cloud_firestore/cloud_firestore.dart';

class Flashcard {

  final String question;
  final String meaning;
  final String sentence;
  final String imgUrl;
  Flashcard({
    required this.question,
    required this.meaning,
    required this.sentence,
    required this.imgUrl,
  });


  Flashcard copyWith({
    String? question,
    String? meaning,
    String? sentence,
    String? imgUrl,
  }) {
    return Flashcard(
      question: question ?? this.question,
      meaning: meaning ?? this.meaning,
      sentence: sentence ?? this.sentence,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'meaning': meaning,
      'sentence': sentence,
      'imgUrl': imgUrl,
    };
  }
}