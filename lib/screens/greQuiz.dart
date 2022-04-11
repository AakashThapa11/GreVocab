import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gre_vocab/model/question.dart';
import 'package:gre_vocab/screens/QuizScreen.dart';


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizScreen(
          totalTime: 100,
          questions: question1),
    );
  }
}


