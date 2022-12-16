import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Saber is a "servant" from fate/zero series', true),
    Question('Kirito is a character from Sword Art Online.', true),
    Question('Haikyuu is a series about football sports.', false),
    Question('Noragami Aragoto is the sequel name of Noragami.', true),
    Question('Kakashi Hatake is a character from Hunter X Hunter.', false),
    Question('Clannad is made by studio Kyoto Animation.', true),
    Question(
        'In the first thought by the students,they thought Korosensei from Assassination Classroom is a human.',
        false),
    Question('Little Busters is a key visual novel adaptation.', true),
    Question('K-ON is a slice of life anime take place in a highschool.', true),
    Question('Kono Suba is a comedy anime.', true),
    Question('Hestia (Danmachi) is a human.', false),
    Question('Rabbit House is a coffee cafe in Gochiusa.', true),
    Question('Date A Live season 1 is created by J.C. Staff.', false),
    Question('Ryuko Matoi is a character from Kill La Kill.', true),
    Question('Rin Tohsaka is a "master" in Fate/Zero series.', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  String result(int scoreLength) {
    if (scoreLength == _questionBank.length) {
      return "Perfect! You're doing exceptionally";
    } else if (scoreLength > 10) {
      return "Very Good! You're very knowledgeable in anime";
    } else if (scoreLength > 5) {
      return "Pretty Nice, try again if you want a higher score!";
    } else {
      return "Try Again!";
    }
  }
}
