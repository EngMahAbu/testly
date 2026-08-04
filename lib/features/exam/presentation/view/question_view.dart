import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_images.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/presentation/view/exam_score_view.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_events.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_state.dart';
import 'package:testly/features/exam/presentation/widgets/choice_list_view.dart';
import 'package:testly/features/exam/presentation/widgets/next_and_back_button.dart';
import 'package:testly/features/exam/presentation/widgets/progress_bar.dart';
import 'package:testly/features/exam/presentation/widgets/show_timeout_dialog.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({
    super.key,
    required this.examTime,
    required this.examId, required this.exam,
  });
  final int examTime;
  final String examId;
  final ExamEntity exam;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExamCubit>(
      create: (_) =>
          getIt.get<ExamCubit>()
            ..doEvent(GetQuestions( exam: exam)),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            actionsPadding: EdgeInsets.only(right: 16),
            title: Text("Exam"),
            actions: [
              Image.asset(AppImages.alarmImage),
              SizedBox(width: 10),
              BlocBuilder<ExamCubit, ExamState>(
                buildWhen: (previous, current) =>
                    previous.remainingSeconds != current.remainingSeconds,
                builder: (context, state) {
                  final minutes = state.remainingSeconds ~/ 60;
                  final seconds = state.remainingSeconds % 60;
                  final int halfTime = (examTime * 60) ~/ 2;
                  return Text(
                    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: state.remainingSeconds <= halfTime
                          ? AppColors.lightRed
                          : AppColors.lightGreen,
                    ),
                  );
                },
              ),
            ],
          ),
          body: BlocConsumer<ExamCubit, ExamState>(
            listenWhen: (previous, current) {
              return previous.submitExam.data == null &&
                  current.submitExam.data != null;
            },
            listener: (context, state) async {
              if (state.isExamFinished) {
                await showTimeoutDialog(context, state);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ExamScoreView(result: state.submitExam.data!),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state.questions == null || state.questions!.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.questions!.errorMessage.isNotEmpty) {
                return Center(child: Text(state.questions!.errorMessage));
              }

              final questions = state.questions!.data ?? [];

              if (questions.isEmpty) {
                return Center(child: Text(AppStrings.notFoundQuestions));
              }

              final currentQuestion = questions[state.currentQuestionIndex];
              final selectedAnswer =
                  state.selectedAnswers[currentQuestion.id] ?? '';
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProgressBar(
                      questions: questions,
                      currentIndex: state.currentQuestionIndex,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      currentQuestion.question,
                      style: const TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 20),

                    ChoiceListView(
                      questions: currentQuestion,
                      selectedAnswer: selectedAnswer,
                    ),
                    const SizedBox(height: 20),

                    NextAndBackButton(questions: questions, state: state),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
