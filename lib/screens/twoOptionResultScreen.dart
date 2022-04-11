import 'package:flutter/material.dart';
import 'package:gre_vocab/model/questionModelBest.dart';
import 'package:gre_vocab/screens/reviseScreen.dart';
import 'package:gre_vocab/screens/twoOtptionQuizScreen.dart';


class revResultScreen extends StatefulWidget {

 final int score;
 final List<QuestionModelBest> ques;

  revResultScreen(this.score, this.ques, {Key? key}) : super(key: key);

  @override
  _revResultScreenState createState() => _revResultScreenState();
}

class _revResultScreenState extends State<revResultScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Revise()));
        return true;
       },
      child: Scaffold(
        backgroundColor: Colors.orange[300] ,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                "Congratulations",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            Text(
              "You Score is",
              style: TextStyle(color: Colors.white, fontSize: 34.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "${widget.score}/${widget.ques.length}",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 85.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => bestOneTest(ques: widget.ques)));
              },
              shape: StadiumBorder(),
              color: Colors.orange,
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Reapeat the quiz",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
