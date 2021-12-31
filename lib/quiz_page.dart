import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // get instance from QuizBrain class
  QuizBrain quizBrain = QuizBrain();

  // tracking a Score icons
  List<Icon> scoreKeeper = [];

  // check the score and set the state from the true and false button
  void checkAnswer(bool check) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
                context: context,
                title: "FINISHED",
                desc: "You reached the end of the quizz ")
            .show();
        scoreKeeper = [];
      } else {
        if (quizBrain.getAnswerText() == check) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        }
      }
      quizBrain.getNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //Display the Question
        Expanded(
          flex: 13,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        //True button
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                //check whether the answer is "true" or not
                checkAnswer(true);
              },
              child: const Text(
                "True",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),

        ///False Button
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                //check whether the answer is "false" or not
                checkAnswer(false);
              },
              child: const Text(
                "False",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),

        // Display scoreicon from the scorekeeper list
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
