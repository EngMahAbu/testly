import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_state.dart';

class ExamDetailsCard extends StatelessWidget {
  const ExamDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        final examsOfSubject = state.exams;
        if (examsOfSubject!.isLoading == true) {
          return Center(child: CircularProgressIndicator());
        } else if (examsOfSubject.errorMessage.isNotEmpty) {
          return Center(child: Text(examsOfSubject.errorMessage));
        } else if (examsOfSubject.data!.isEmpty) {
          return Center(child: Text(AppStrings.notFoundSubjects));
        }
        return Container(
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0x402A2929),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 24),
              // SizedBox(
              //   width: 40,
              //   height: 40,
              //   child: Image.network(
              //     subjectImg,
              //     fit: BoxFit.contain,
              //     errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
              //   ),
              // ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  examsOfSubject.data![0].duration.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        );
      },
    );
  }
}
