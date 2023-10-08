import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function() ActionOnPressed;
  const Answer(this.ActionOnPressed, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text(
              answerText,
              style: TextStyle(fontSize: 25),
            ),
            onPressed: ActionOnPressed,
          ),
        ));
  }
}
