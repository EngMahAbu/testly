import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/domain/entities/exam_result_entity.dart';
import 'package:testly/features/exam/presentation/view/results_history_view.dart';
import 'package:testly/features/exam/presentation/view/results_view.dart';
import 'package:testly/features/exam/presentation/widgets/score_diagram.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({super.key, required this.result});

  final ExamResultEntity result;

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          AppStrings.examResultText,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              AppStrings.yourScoreText,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),

            const SizedBox(height: 24),

            ScoreDiagram(result: result),
            SizedBox(height: 80),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultsHistoryView()),
                  );
                },
                child: const Text(
                  AppStrings.showResultsButton,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: TextButton(
                style: TextButton.styleFrom(
                  side: BorderSide(color: AppColors.blue, width: 2),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppStrings.startAgainButton,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
