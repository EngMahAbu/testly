import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/features/exam/data/model/local_models/saved_exam_model.dart';
import 'package:testly/features/exam/data/model/local_models/saved_question_model.dart';

class ReviewExamView extends StatelessWidget {
  final SavedExamModel exam;

  const ReviewExamView({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Review Result'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: exam.questions.length,
        itemBuilder: (context, index) {
          final question = exam.questions[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ReviewQuestionCard(
              questionNumber: index + 1,
              question: question,
            ),
          );
        },
      ),
    );
  }
}

class ReviewQuestionCard extends StatelessWidget {
  const ReviewQuestionCard({
    super.key,
    required this.question,
    required this.questionNumber,
  });

  final SavedQuestionModel question;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    final selectedAnswers = question.selectedAnswer
        .split(',')
        .map((answer) => answer.trim())
        .toSet();

    final correctAnswers = question.correctAnswer
        .split(',')
        .map((answer) => answer.trim())
        .toSet();

    return Card(
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            Text(
              question.question,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 16),

            Column(
              children: List.generate(question.answers.length, (index) {
                final answer = question.answers[index];

                final isSelected = selectedAnswers.contains(answer.key);

                final isCorrect = correctAnswers.contains(answer.key);

                final isWrong = isSelected && !isCorrect;

                return Container(
                  height: 52,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? AppColors.lightGreen.withValues(alpha: 0.15)
                        : isWrong
                        ? AppColors.lightRed.withValues(alpha: 0.15)
                        : const Color(0xffEDEFF3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isCorrect
                          ? AppColors.lightGreen
                          : isWrong
                          ? AppColors.lightRed
                          : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      Radio<String>(
                        value: answer.key,
                        groupValue: isSelected ? answer.key : null,
                        onChanged: null,
                        activeColor: isCorrect
                            ? AppColors.lightGreen
                            : AppColors.lightRed,
                      ),

                      Expanded(
                        child: Text(
                          answer.answer,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
