import 'package:flutter/material.dart';
import 'package:gre_vocab/HomePage.dart';
import 'package:gre_vocab/model/questionModelBest.dart';
import 'package:gre_vocab/screens/reviseFlashCard.dart';
import 'package:gre_vocab/screens/twoOtptionQuizScreen.dart';


class Revise extends StatefulWidget {
  const Revise({Key? key}) : super(key: key);
  

  @override
  _ReviseState createState() => _ReviseState();
}

class _ReviseState extends State<Revise> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        return true;
       },
      child: Scaffold(
        appBar: AppBar(title: Text('GRE VOCAB'),
          backgroundColor: Colors.orange,),
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          color: Colors.orange[300],
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: 10,right: 10),
                child: InkWell(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: 285,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 20,bottom: 10),
                            child: Text('Use Flashcard app to quickly revise the words.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black87,),
                            ),
                          ),
                        ),
                        Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '  Flash Card',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    WidgetBuilder builder = (_) => const reviseFlashcard();
                    Route route = MaterialPageRoute(builder: builder);
                    Navigator.push(context, route);
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Padding(padding: EdgeInsets.only(left: 10,right: 10),
                child: InkWell(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: 285,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 20,bottom: 10),
                            child: Text('Choose the best word to complete the sentence.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black87,),
                            ),
                          ),
                        ),
                        Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '  Quiz',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _bestOnetest(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _flashCardRevise(context) {
    WidgetBuilder builder = (_) => const reviseFlashcard();
    Route route = MaterialPageRoute(builder: builder);
    Navigator.push(context, route);
  }


  void _bestOnetest(context) {
    WidgetBuilder builder = (_) => bestOneTest(ques: ques1);
    Route route = MaterialPageRoute(builder: builder);
    Navigator.push(context, route);
  }


}