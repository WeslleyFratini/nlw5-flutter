import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
        name: "Weslley Fratini",
        photoUrl: "https://avatars.githubusercontent.com/u/39966929?v=4");
  }
}

void getQuizzes() {
  quizzes = [
    QuizModel(
        title: "NLW5 - Flutter ",
        imagem: AppImages.blocks,
        questionAwnsered: 1,
        level: Level.facil,
        questions: [
          QuestionModel(title: "Esta curtindo o Flutter?", awnsers: [
            AwnserModel(title: "Estou curtindo"),
            AwnserModel(title: "Estou adorando"),
            AwnserModel(title: "Estou achando massa"),
            AwnserModel(title: "Estou achando show de bola", isRight: true),
          ]),
          QuestionModel(title: "Esta curtindo o Flutter?", awnsers: [
            AwnserModel(title: "Estou curtindo"),
            AwnserModel(title: "Estou adorando"),
            AwnserModel(title: "Estou achando massa"),
            AwnserModel(title: "Estou achando show de bola", isRight: true),
          ])
        ])
  ];
}
