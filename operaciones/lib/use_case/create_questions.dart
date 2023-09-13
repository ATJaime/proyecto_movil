import 'dart:math';

class Questions {
  var operators = ['+', '-', '*', '/'];
  int terms = 2;
  String createQuestions(int score) {
    String question = "";
    for (int i = 1; i <= terms; i++) {
      var value = Random().nextInt(10);
      String strvalue = value.toString();

      if (i != terms - 1) {
        var nOp = Random().nextInt(0);
        question = question + strvalue + operators[nOp];
      } else {
        question = question + strvalue;
      }
    }
    return question;
  }
}

var q = Questions().createQuestions(0);
print(q) {
  // TODO: implement print
  throw UnimplementedError();
}
