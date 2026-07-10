import 'package:flutter_test/flutter_test.dart';
import 'package:testly/config/base_response/base_response.dart';

void main() {
  group('BaseResponse', () {
    test('wraps successful values in SuccessResponse', () {
      final response = SuccessResponse<int>(42);

      expect(response, isA<SuccessResponse<int>>());
      expect(response.data, 42);
    });

    test('wraps error messages in ErrorResponse', () {
      final response = ErrorResponse<int>('boom');

      expect(response, isA<ErrorResponse<int>>());
      expect(response.errorMessage, 'boom');
    });

    test('preserves custom error messages', () {
      final response = ErrorResponse<String>('connection timeout,please try again');

      expect(response.errorMessage, 'connection timeout,please try again');
    });
  });
}
