import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(top: true, child: QuestionIndicatorWidget()),
        preferredSize: Size.fromHeight(60),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: QuizWidget(
          title: "O que o Flutter faz em sua totalidade?",
        ),
      ),
    );
  }
}
