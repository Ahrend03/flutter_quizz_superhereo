import 'package:flutter/material.dart';
import 'package:flutter_quizz_superhereo/quizz_hereo.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  QuizzHereo quizzHereo = QuizzHereo();
  int score = 0;
  int n = 0;

  void checkAnswer(String answer) {
    if (answer == quizzHereo.questionList[n].answer) {
      score++;
    }

    if (quizzHereo.isFinished()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Cuestionario terminado'),
          content: Text('Puntaje: $score/${quizzHereo.questionList.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  quizzHereo.restarQuizz();
                  score = 0;
                  n = 0;
                });
              },
              child: Text('Reiniciar'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        quizzHereo.nextQuestion();
        n = quizzHereo.questionIndex;
      });
    }
  }

void showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Puntaje Actual'),
        content: Text('Puntaje: $score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = quizzHereo.questionList[n];
    final options = currentQuestion.options;
    options.shuffle();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quizz Super Heroes",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff2B2E42),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      currentQuestion.imageUrl,
                    ),
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: buildOptionButton(options[0]),
                  ),
                  Expanded(child: buildOptionButton(options[1]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: buildOptionButton(options[2]),
                  ),
                  Expanded(child: buildOptionButton(options[3]),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: showScoreDialog,
                child: Text(
                  'Score: $score',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blueAccent, // background color
                  foregroundColor: Colors.white, // text color
                ),),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionButton(String option) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        onPressed: () {
          checkAnswer(option);
        },
        child: Text(
          option,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.blueAccent,
      ),
    );
  }
}