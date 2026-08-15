import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/presentation/view/question_view.dart';
import 'package:testly/features/exam/presentation/widgets/exam_description.dart';
import 'package:testly/features/exam/presentation/widgets/instructions_details.dart';

class ExamInstructionsView extends StatelessWidget {
  const ExamInstructionsView({super.key, required this.exams});
  final ExamEntity exams;

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
      ),
      body: Column(
        children: [
          ExamDescription(exams: exams),

          SizedBox(height: 16),

          Divider(color: AppColors.black, thickness: .5),
          SizedBox(height: 24),
          InstructionsDetails(),
          SizedBox(height: 48),

          SizedBox(
            width: 340,
            height: 48,
            child: ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsView(
                      examTime: exams.duration,
                      examId: exams.id,
                      exam: exams,
                    ),
                  ),
                );
              },
              child: Text(
                AppStrings.startButton,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
