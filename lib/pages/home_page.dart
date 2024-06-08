
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
              Column(
                children: options.map((option) {
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
                      color: Colors.blueGrey,
                    ),
                  );
                }).toList(),
              ),
              Spacer(),
              Text(
                'Score: $score',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}