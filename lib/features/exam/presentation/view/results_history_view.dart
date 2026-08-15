import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:testly/features/exam/data/model/local_models/saved_exam_model.dart';
import 'package:testly/features/exam/presentation/view/results_view.dart';
import 'package:testly/features/exam/presentation/widgets/result_history_card.dart';

class ResultsHistoryView extends StatelessWidget {
  const ResultsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text('Results'),
        ),
      ),

      body: ValueListenableBuilder<Box<SavedExamModel>>(
        valueListenable: Hive.box<SavedExamModel>(
          'saved_exams_box',
        ).listenable(),

        builder: (context, box, _) {
          final exams = box.values.toList();

          if (exams.isEmpty) {
            return const Center(
              child: Text(
                'No exam results yet',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: exams.length,

            itemBuilder: (context, index) {
              final exam = exams[index];
              final date =
                  "${exam.submittedAt.day}/${exam.submittedAt.month}/${exam.submittedAt.year} ";

              final questions = exam.questions;

              final totalQuestions = questions.length;

              final correctAnswers = questions
                  .where(
                    (question) =>
                        question.selectedAnswer == question.correctAnswer,
                  )
                  .length;

              final score = totalQuestions == 0
                  ? 0.0
                  : (correctAnswers / totalQuestions) * 100;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ResultHistoryCard(
                  duration: exam.submittedAt,
                  examTitle: exam.title,
                  score: score,
                  correctAnswers: correctAnswers,
                  totalQuestions: totalQuestions,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewExamView(exam: exam),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
