import 'package:dev_quiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:dev_quiz/view/shared/models/awnser_model.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/view/settings/settings_controller.dart';
import 'package:dev_quiz/view/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  //se foi selecionado uma resposta certa/errada
  // ValueChanged eh um tipo de funcao que devolve o valor atualizado da mudanca
  final ValueChanged<bool> onAnswerSelected;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {

    SettingsController settingsController =
        Provider.of<SettingsController>(context);
        
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 257,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                widget.question.title,
                style: AppTextStyles.heading.copyWith(
                  color: settingsController.currentAppTheme.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          for (int i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answerModel: answer(i),
              isSelected: indexSelected == i,
              isDisabled: indexSelected !=
                  -1, //se for diferente de -1, ele ja clicou em alguem, logo n pode mais
              onTap: (valueIsRight) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onAnswerSelected(valueIsRight));
              },
            ),
        ],
      ),
    );
  }
}