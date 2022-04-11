import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gre_vocab/model/questionModelBest.dart';
import 'package:gre_vocab/screens/reviseScreen.dart';
import 'package:gre_vocab/screens/twoOptionResultScreen.dart';


class bestOneTest extends StatefulWidget {
  const bestOneTest({Key? key, required this.ques}) : super(key: key);
  final List<QuestionModelBest> ques;

  @override
  _bestOneTestState createState() => _bestOneTestState();
}

class _bestOneTestState extends State<bestOneTest> {

 int question_pos = 0;
  int score = 0;
  bool btnPressedD = false;
  PageController? _contrl;
  String btnText = "Next Question";
  bool answered = false;
  List<String> lists = ['List 1', 'List 2','List 3'];
  String? selectedList;

 late  InterstitialAd _interstitialAd ;
 bool _isAdLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contrl = PageController(initialPage: 0);
    _initinterstitialAd();
  }


 _initinterstitialAd() {
   InterstitialAd.load(
       adUnitId: InterstitialAd.testAdUnitId,
       request: AdRequest(),
       adLoadCallback:
       InterstitialAdLoadCallback(
           onAdLoaded: onAdLoaded,
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Revise()));
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.orange[300],
        appBar: AppBar(title: Text("Chose the best Answer"),
          backgroundColor: Colors.orange,),
        body:

        Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageView.builder(
                controller: _contrl,
                onPageChanged: (page) {
                  if (page == widget.ques.length - 1) {
                    setState(() {
                      btnText = "See Results";
                    });
                  }
                  setState(() {
                    answered = false;
                  });
                },
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Question ${index + 1}/${widget.ques.length}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              "${widget.ques[index].question}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        for (int i = 0; i < widget.ques[index].answers!.length; i++)
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            margin: EdgeInsets.only(
                                bottom: 10.0, left: 12.0, right: 12.0),
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fillColor: btnPressedD
                                  ? widget.ques[index].answers!.values.toList()[i]
                                  ? Colors.green
                                  : Colors.red
                                  : Colors.white,
                              onPressed: !answered
                                  ? () {
                                if (widget.ques[index]
                                    .answers!
                                    .values
                                    .toList()[i]) {
                                  score++;
                                } else {
                                }
                                setState(() {
                                  btnPressedD = true;
                                  answered = true;
                                });
                              }
                                  : null,
                              child: Text(widget.ques[index].answers!.keys.toList()[i],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  )),
                            ),
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            if (_contrl!.page?.toInt() == widget.ques.length - 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => revResultScreen(score, widget.ques)));
                              _interstitialAd.show();
                            } else {
                              _contrl!.nextPage(
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeInExpo);
                              setState(() {
                                btnPressedD = false;
                              });
                            }
                          },
                          shape: StadiumBorder(),
                          fillColor: Colors.orange,
                          padding: EdgeInsets.all(18.0),
                          elevation: 0.0,
                          child: Text(
                            btnText,
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 30),
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
                                  builder: (context) => bestOneTest(ques: ques1)
                                ));
                              });
                            }else if(list == "List 2"){
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => bestOneTest(ques: ques2)

                                ));
                              });

                            }
                            else if(list == "List 3"){
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => bestOneTest(ques: ques3)

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

                  );
                },
                itemCount: widget.ques.length,
              )
          ),

        ),
      ),
    );
  }
}