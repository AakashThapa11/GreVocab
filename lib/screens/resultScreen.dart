import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gre_vocab/HomePage.dart';
import 'package:gre_vocab/model/question.dart';
import 'package:gre_vocab/screens/QuizScreen.dart';



class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.score,
    required this.questions,
    required this.totalTime,
  }) : super(key: key);

  final int score;
  final List<Question> questions;
  final int totalTime;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        return true;
       },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange,Colors.orangeAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
    
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Result: ${widget.score} / ${widget.questions.length}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  child: OutlineButton(
                    splashColor: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: widget.totalTime,
                            questions: widget.questions,
                          ),
                        ),
                      );
                    }, child: Text(
                    'Start Again',
                    style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: OutlineButton(
                    splashColor: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => HomePage()
                        ),
                      );
                    }, child: const Text(
                    'Main Menu',
                    style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}