import 'package:flutter/material.dart';
import 'package:quizapp/main.dart';

class Result extends StatelessWidget {
  final Function() resultNum;
  final int resultScore;
  Result(this.resultNum, this.resultScore);
  String get resultPharase {
    String resultText;
    if (resultScore >= 70) {
      resultText = 'You are awesome !';
    } else if (resultScore >= 40) {
      resultText = 'Pretty likeable!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPharase,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: isSwitched == false ? Colors.black : Colors.white,
            ),
          ),
          Text(
            "$resultScore",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: isSwitched == false ? Colors.black : Colors.white,
            ),
          ),
          TextButton(
            child: Text(
              "Restart The App",
              style: TextStyle(color: Colors.orange),
            ),
            onPressed: resultNum,
          )
        ],
      ),
    );
  }
}
