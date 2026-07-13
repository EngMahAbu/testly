import 'package:injectable/injectable.dart';
import 'package:testly/config/api_error_handler/api_error_handler.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/api/client/exam_api_client.dart';
import 'package:testly/features/exam/data/data_sources/remote/exam_remote_data_source.dart';
import 'package:testly/features/exam/data/model/subjects_response.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ExamApiClient apiClient;

  ExamRemoteDataSourceImpl(this.apiClient);

  @override
  Future<BaseResponse<SubjectsResponse>> getSubjects() async {
    try {
      final response = await apiClient.getSubjects();
      return SuccessResponse(response);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException(e);
    }
  }
}
