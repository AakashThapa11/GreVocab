import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String text;

  const FlashcardView({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(text: text.toUpperCase(),style: const TextStyle(color: Colors.teal,fontSize: 30,overflow: TextOverflow.fade)
              ),
            ),
          ),
        )
    );
  }
}
