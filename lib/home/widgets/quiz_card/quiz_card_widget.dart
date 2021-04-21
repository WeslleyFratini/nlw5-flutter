import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widget/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChallengePage()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(color: AppColors.border))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 35,
              height: 35,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Gerenciamento de Estado", style: AppTextStyles.heading15),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "3/10",
                    style: AppTextStyles.body11,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 3,
                  child: ProgressIndicatorWidget(
                    value: .3,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}