import 'package:dev_quiz/view/shared/widget/progress_indicator_widget.dart';
import 'package:dev_quiz/core/app_theme.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/view/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int completed;
  final int totalQuestions;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.totalQuestions,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController =
        Provider.of<SettingsController>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          color: AppTheme.backgroundColors(
              settingsController.currentAppTheme.brightness),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(
                AppImages.blocks,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              this.title,
              style: AppTextStyles.heading15.copyWith(
                color: settingsController.currentAppTheme.primaryColor,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "${this.completed} de ${this.totalQuestions}",
                    style: AppTextStyles.body11.copyWith(
                      color: settingsController.currentAppTheme.primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(
                    value: this.completed / this.totalQuestions,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}