import 'package:assets_audio_player/assets_audio_player.dart';
import 'question.dart';

class QuizBrain {
  int _counter = 0;

  final List<Question> _listOfQuestions = [
    Question(
        'On the space shuttle, a potato was planted as the first crop', true),
    Question('An ant can lift 1,000 times its body weight', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('The world’s largest island is Greenland', true),
    Question('An octopus has five hearts', false),
    Question('South Africa has three capitals', true),
    Question(
        'No piece of square dry paper can be folded in half, more than 7 times.',
        true),
    Question('On the moon, an astronaut once played golf', true),
    Question(
        'The two longest rivers in the world are the Mississippi and the Nile',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question('Bats are blind', false),
    Question('The human eye can distinguish 10 million different colors', true),
    Question('Pineapples grow on trees', false),
  ];

  void nextQuestion() {
    if (_counter < _listOfQuestions.length - 1) {
      _counter++;
    }
  }

  String getQuestionText() => _listOfQuestions[_counter].questionText!;
  bool getQuestionAnswer() => _listOfQuestions[_counter].questionAnswer!;

  bool isFinished() {
    if (_counter >= _listOfQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _counter = 0;
  }
}
