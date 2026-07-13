import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';
import 'package:testly/features/exam/domain/usecases/get_subjects_use_case.dart';
import 'package:testly/features/exam/presentation/view_model/cubit/exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetSubjectsUseCase _getSubjectsUseCase;

  ExamCubit(this._getSubjectsUseCase) : super(ExamState(subjects: BaseState()));

  Future<void> getSubjects() async {
    emit(state.copyWith(subjects: state.subjects?.copyWith(isLoading: true)));

    final response = await _getSubjectsUseCase();

    switch (response) {
      case SuccessResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjects: state.subjects?.copyWith(
              isLoading: false,
              data: response.data,
            ),
          ),
        );

      case ErrorResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjects: state.subjects?.copyWith(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }
}
