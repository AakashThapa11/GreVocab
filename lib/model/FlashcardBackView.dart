import 'package:flutter/material.dart';

class FlashcardBackView extends StatelessWidget {
  final String meaning;
  final String sentence;
  final String imgUrl;

  const FlashcardBackView({Key? key, required this.meaning, required this.sentence, required this.imgUrl,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      child: Column(
        children: [
          Card(
            elevation: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Meaning: ",style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                        Expanded(
                          child: RichText(
                            text: TextSpan(text: meaning,style: const TextStyle(color: Colors.teal,fontSize: 20,overflow: TextOverflow.fade),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 200,
                        width: 200,
                        child: Image.network(
                            imgUrl)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sentence: ",style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                        Flexible(
                          fit: FlexFit.loose,
                          child: RichText(
                            text: TextSpan(text: sentence,style: const TextStyle(color: Colors.teal,fontSize: 20,overflow: TextOverflow.fade),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
