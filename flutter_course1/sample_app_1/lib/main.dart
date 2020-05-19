import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //the second step is to call the function createState() nd then return MyAppState.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//connecting setup for the two classes
//the first step is to add the <MyApp>
//_ creates the public class into the private class

class _MyAppState extends State<MyApp> {
  final ques = const [
    //creating question and answer keys together using the map the syntax for which is {}
    {
      'questionText': 'what is your favourite color?',
      'answers': ['black', 'red', 'green', 'white'],
    },
    {
      'questionText': 'what\'s your favpurite animal?',
      'answers': ['dog', 'cat', 'lion', 'tiger'],
    },
    {
      'questionText': 'who\'s your favpurite instructor?',
      'answers': ['max', 'max', 'max', 'amx'],
    },
  ];
  var _questionIndex = 0;
  //a function for button
  void _ansQues() {
//    var aBool = true;
//    aBool = false;

    //calls the build method again
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < ques.length) {
      print('we have more questions');
    } else {
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < ques.length
            ? Column(
                children: [
                  Question(
                    //call the question index and also the key fpr accessing the question text
                    ques[_questionIndex]['questionText'],
                  ),
                  //... is the spread function
                  ...(ques[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_ansQues, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('done'),
              ),
      ),
    );
  }
}
