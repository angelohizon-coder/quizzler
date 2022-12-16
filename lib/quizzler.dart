import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'quiz_brain.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  // score list
  List<Widget> score = [];
  // numerical score counter
  int numberOfCorrectAnswer = 0;

  // initialize to use their methods
  QuizBrain quizBrain = new QuizBrain();
  AudioCache audioCache = new AudioCache();

  // checker
  void checker(bool answer, bool correctAnswer) {
    if (answer == correctAnswer) {
      audioCache.play("sounds/correct.wav");
      score.add(Icon(Icons.check, color: Colors.green));
      numberOfCorrectAnswer++;
    } else {
      audioCache.play("sounds/wrong.wav");
      score.add(Icon(Icons.close, color: Colors.red));
    }
  }

  // checks if the quiz is all answered or not
  void checkAnswer(bool answer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        // separated from the else if statement to only check the answer
        checker(answer, correctAnswer);

        Alert(
          context: context,
          title: quizBrain.result(numberOfCorrectAnswer),
          desc: '$numberOfCorrectAnswer/15',
          alertAnimation: fadeAlertAnimation,
          buttons: [
            DialogButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ).show();
        numberOfCorrectAnswer = 0;
        score = [];
        quizBrain.reset();
      }
      // checks answer plus transition to next question
      else if (quizBrain.isFinished() == false && score.length < 15) {
        checker(answer, correctAnswer);
        quizBrain.nextQuestion();
      }
    });
  }

  // widget animation with fade rather than going down the screen
  Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  // layout of the widget seen on the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Quizzler App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  "True",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  "False",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
