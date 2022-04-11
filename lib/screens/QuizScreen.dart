import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gre_vocab/HomePage.dart';
import 'package:gre_vocab/model/question.dart';
import 'package:gre_vocab/screens/greQuiz.dart';
import 'package:gre_vocab/screens/resultScreen.dart';



class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.totalTime, required this.questions}) : super(key: key);

  final int totalTime;
  final List<Question> questions;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int _currentTime;
  late Timer _timer;
  int _currentIndex = 0;
  String _selectedAnswer = '';
  int _score = 0;
  String? selectedList;
  List<String> lists = ['List 1', 'List 2','List 3', 'List 4','List 5', 'List 6','List 7', 'List 8','List 9', 'List 10','List 11', 'List 12','List 13'];

  late  InterstitialAd _interstitialAd ;
  bool _isAdLoaded = false;


  @override
  void initState() {
    super.initState();
    _currentTime = widget.totalTime;
    _initinterstitialAd();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _currentTime - 1;
      });
      if(_currentTime == 0){
        _timer.cancel();
        pushResultScreen(context);
      }
    });
  }

  _initinterstitialAd() {
    InterstitialAd.load(
        adUnitId: InterstitialAd.testAdUnitId,
        request: AdRequest(),
        adLoadCallback:
        InterstitialAdLoadCallback(
            onAdLoaded:  onAdLoaded,
            onAdFailedToLoad: (error) {}));
  }

  void onAdLoaded(InterstitialAd ad){
    _isAdLoaded = true;
    _interstitialAd = ad;

    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad){
        _interstitialAd.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error){
        _interstitialAd.dispose();
      }
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentIndex];
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
          child: Padding(
            padding: const EdgeInsets.only(top: 80,right: 16,left: 16,bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        LinearProgressIndicator(
                          value: _currentTime / widget.totalTime,
                        ),
                        Center(
                          child: Text(
                            _currentTime.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Text('Question', style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),
                SizedBox(height: 10,),
                Text(currentQuestion.question,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index){
                      final answer = currentQuestion.answers[index];
                      return AnswerTile(
                        isSelected: answer == _selectedAnswer,
                        answer: answer,
                        correctAnswer: currentQuestion.correctAnswer,
                        onTap: (){
                          setState(() {
                            _selectedAnswer = answer;
                          });
    
                          if (answer == currentQuestion.correctAnswer) {
                            _score++;
                          }
    
                          Future.delayed(Duration(milliseconds: 2000), () {
                            if (_currentIndex == widget.questions.length - 1) {
                              pushResultScreen(context);
                              return;
                            }
                            setState(() {
                              _currentIndex++;
                              _selectedAnswer = '';
                            });
                          });
    
                        },);
                    },
                    itemCount: currentQuestion.answers.length,),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  value: selectedList,
                  dropdownColor: Colors.orange,
                  iconEnabledColor: Colors.white,
                  isExpanded: true,
                  items: lists.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:TextStyle(color:Colors.white,)),
                    );
                  }).toList(),
                  onChanged: (list) {
                    if(list == "List 1"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question1,
                          ),
                        ));
                      });
                    }else if(list == "List 2"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question2,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 3"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question3,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 4"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question4,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 5"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question5,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 6"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question6,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 7"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question7,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 8"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question8,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 9"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question9,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 10"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question10,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 11"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question11,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 12"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question12,
                          ),
                        ));
                      });
                    }
                    else if(list == "List 13"){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            totalTime: 100,
                            questions: question13,
                          ),
                        ));
                      });
                    }
                    setState(() {
                    });
                  },
                  hint: Text("Click to change list",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  void pushResultScreen(BuildContext context) {
    _interstitialAd.show();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          questions: widget.questions,
          totalTime: widget.totalTime,
          score: _score,
        ),
      ),
    );
  }
  List<Question> list1 = [];
}




class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.isSelected,
    required this.answer,
    required this.correctAnswer,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String answer;
  final String correctAnswer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          answer,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Color get cardColor {
    if (!isSelected) return Colors.white;

    if (answer == correctAnswer) {
      return Colors.green;
    }
    return Colors.redAccent;
  }
}

