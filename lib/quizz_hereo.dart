
import 'package:flutter_quizz_superhereo/pages/models/hero_model.dart';

class QuizzHereo {
  List<HeroModel> questionList = [
    HeroModel(imageUrl: "https://avatars.mds.yandex.net/i?id=5dc81511d2b10327c719ceaf9ba77359210fcc63-9855155-images-thumbs&n=13",
     answer: "BATMAN",
     options: ["THOR","SUPERMAN","BATMAN","ANTMAN"]),
    HeroModel(imageUrl: "https://avatars.mds.yandex.net/i?id=1bc9093b8396d3d08289f93d547c30d2268b5983-9863899-images-thumbs&n=13",
     answer: "SUPERMAN",
     options: ["IRONMAN","SUPERMAN","BATMAN","HULK"]),
    HeroModel(imageUrl: "https://avatars.mds.yandex.net/i?id=5e8e4aa741480bd2919601426bb5c8a0d993ddeb-8342740-images-thumbs&n=13",
     answer: "SPIDERMAN",
     options: ["FALCON","SUPERMAN","BATMAN","SPIDERMAN"]),
    HeroModel(imageUrl: "https://img.asmedia.epimg.net/resizer/yiQQU22M3OJOr5C9gcK2Vwlyngw=/1472x1104/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/BBKLXDTL45M43FMNMLJJO4GWRM.jpg",
     answer: "IRONMAN",
     options: ["SPIDERMAN","SUPERMAN","IRONMAN","CAPITAN"]),
    HeroModel(imageUrl: "https://cdn.sortiraparis.com/images/1004/66131/305301-thor-ragnarok-critique-et-bande-annonce.jpg",
     answer: "THOR",
     options: ["PANTERA","SUPERMAN","THOR","ANTMAN"]),
    HeroModel(imageUrl: "https://gogocatrina.com/wp-content/uploads/2019/11/ant-man-regresa-para-una-tercera-pelicula-620x420@2x.jpg",
     answer: "ANTMAN",
     options: ["FLASH","ANTMAN","BATMAN","SUPERMAN"]),
  ];
  int questionIndex = 0;

  String getQuestionText() {
    return questionList[questionIndex].imageUrl;
  }

  String getQuestionAnswer() {
    return questionList[questionIndex].imageUrl;
  }

  String getAnswerNumber() {
    return (questionIndex + 1).toString();
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    }
  }

  bool isFinished() {
    // if (questionIndex > questionList.length - 1) {
    //   return true;
    // } else {
    //   return false;
    // }
    print(questionIndex);
    print(questionList.length - 1);
    return questionIndex > questionList.length - 2 ? true : false;
  }

  void restarQuizz() {
    questionIndex = 0;
  }
}